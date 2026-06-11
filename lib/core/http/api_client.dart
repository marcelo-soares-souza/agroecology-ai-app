import 'dart:async';

import 'package:dio/dio.dart';

import '../config/environment.dart';
import '../error/exceptions.dart';
import '../storage/token_storage.dart';

typedef OnAuthFailure = void Function();

class ApiClient {
  final Environment environment;
  final TokenStorage tokenStorage;
  final OnAuthFailure? onAuthFailure;
  late final Dio _dio;
  bool _isRefreshing = false;
  final List<Completer<void>> _refreshQueue = [];

  ApiClient({
    required this.environment,
    required this.tokenStorage,
    this.onAuthFailure,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: environment.apiBaseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.add(_authInterceptor());
    _dio.interceptors.add(_refreshInterceptor());
  }

  Dio get dio => _dio;

  InterceptorsWrapper _authInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await tokenStorage.getAccessToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
    );
  }

  InterceptorsWrapper _refreshInterceptor() {
    return InterceptorsWrapper(
      onError: (error, handler) async {
        if (error.response?.statusCode != 401) {
          return handler.next(error);
        }

        if (_isPublicAuthEndpoint(error.requestOptions.path)) {
          return handler.next(error);
        }

        final refreshToken = await tokenStorage.getRefreshToken();
        if (refreshToken == null) {
          onAuthFailure?.call();
          return handler.next(error);
        }

        if (_isRefreshing) {
          final completer = Completer<void>();
          _refreshQueue.add(completer);
          await completer.future;
          return _retryRequest(error, handler);
        }

        _isRefreshing = true;

        try {
          final response = await Dio(
            BaseOptions(baseUrl: environment.apiBaseUrl),
          ).post('/api/v1/auth/refresh', data: {'refresh_token': refreshToken});

          if (response.statusCode == 200) {
            final data = response.data as Map<String, dynamic>;
            await tokenStorage.saveTokens(
              accessToken: data['access_token'] as String,
              refreshToken: data['refresh_token'] as String,
            );

            for (final completer in _refreshQueue) {
              completer.complete();
            }
            _refreshQueue.clear();
            _isRefreshing = false;

            return _retryRequest(error, handler);
          }
        } catch (_) {}

        _isRefreshing = false;
        for (final completer in _refreshQueue) {
          completer.completeError(AppException(message: 'Refresh failed'));
        }
        _refreshQueue.clear();

        await tokenStorage.clearTokens();
        onAuthFailure?.call();
        handler.next(error);
      },
    );
  }

  bool _isPublicAuthEndpoint(String path) {
    return path == '/api/v1/auth/login' ||
        path == '/api/v1/auth/register' ||
        path == '/api/v1/auth/human-challenge' ||
        path == '/api/v1/auth/confirm-email' ||
        path == '/api/v1/auth/confirm-email/resend' ||
        path.startsWith('/api/v1/auth/password-reset/');
  }

  Future<void> _retryRequest(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    final token = await tokenStorage.getAccessToken();
    if (token != null) {
      error.requestOptions.headers['Authorization'] = 'Bearer $token';
    }

    try {
      final response = await _dio.fetch(error.requestOptions);
      handler.resolve(response);
    } catch (_) {
      handler.next(error);
    }
  }

  AppException _mapError(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionError) {
      return NetworkException(
        message: 'connectionError',
        statusCode: error.response?.statusCode,
      );
    }

    final response = error.response;
    if (response != null) {
      final data = response.data;
      String message = 'chatError';

      if (data is Map<String, dynamic>) {
        final detail = data['detail'];
        if (detail is String) {
          message = detail;
        } else if (detail is List) {
          for (final item in detail) {
            if (item is Map<String, dynamic>) {
              final msg = item['msg'] as String?;
              if (msg != null) {
                message = msg;
                break;
              }
            }
          }
        }
      }

      if (response.statusCode == 401) {
        return AuthException(message: message, statusCode: response.statusCode);
      }

      if (response.statusCode == 403) {
        return ForbiddenException(
          message: message,
          statusCode: response.statusCode,
        );
      }

      return AppException(message: message, statusCode: response.statusCode);
    }

    return AppException(message: error.message ?? 'chatError');
  }

  Future<Map<String, dynamic>> getAuthenticated(
    String path, {
    required String token,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final bareDio = Dio(
        BaseOptions(
          baseUrl: environment.apiBaseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      final response = await bareDio.get<Map<String, dynamic>>(
        path,
        queryParameters: queryParameters,
      );
      return response.data ?? {};
    } on DioException catch (e) {
      throw _mapError(e);
    }
  }

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      return response.data as T;
    } on DioException catch (e) {
      throw _mapError(e);
    }
  }

  Future<Map<String, dynamic>> post(
    String path, {
    dynamic data,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        path,
        data: data,
        cancelToken: cancelToken,
      );
      return response.data ?? {};
    } on DioException catch (e) {
      throw _mapError(e);
    }
  }

  Future<Map<String, dynamic>> put(
    String path, {
    dynamic data,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        path,
        data: data,
        cancelToken: cancelToken,
      );
      return response.data ?? {};
    } on DioException catch (e) {
      throw _mapError(e);
    }
  }

  Future<Map<String, dynamic>> postMultipart(
    String path, {
    required FormData formData,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        path,
        data: formData,
        cancelToken: cancelToken,
      );
      return response.data ?? {};
    } on DioException catch (e) {
      throw _mapError(e);
    }
  }

  Future<void> delete(String path, {CancelToken? cancelToken}) async {
    try {
      await _dio.delete(path, cancelToken: cancelToken);
    } on DioException catch (e) {
      throw _mapError(e);
    }
  }
}
