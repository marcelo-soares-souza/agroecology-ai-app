import 'package:dio/dio.dart';

import '../../../../core/http/api_client.dart';
import '../models/auth_dtos.dart';

class AuthApiDataSource {
  final ApiClient _client;

  AuthApiDataSource(this._client);

  String get _prefix => '/api/v1/auth';

  Future<ChallengeResponse> getHumanChallenge({String locale = 'pt-BR'}) async {
    final data = await _client.get(
      '$_prefix/human-challenge',
      queryParameters: {'locale': locale},
    );
    return ChallengeResponse.fromJson(data);
  }

  Future<MessageResponse> register(Map<String, dynamic> body) async {
    final data = await _client.post('$_prefix/register', data: body);
    return MessageResponse.fromJson(data);
  }

  Future<TokenResponse> login(Map<String, dynamic> body) async {
    final data = await _client.post('$_prefix/login', data: body);
    return TokenResponse.fromJson(data);
  }

  Future<TokenResponse> refresh(Map<String, dynamic> body) async {
    final data = await _client.post('$_prefix/refresh', data: body);
    return TokenResponse.fromJson(data);
  }

  Future<MessageResponse> logout() async {
    final data = await _client.post('$_prefix/logout');
    return MessageResponse.fromJson(data);
  }

  Future<Map<String, dynamic>> getMe() async {
    final data = await _client.get('$_prefix/me') as Map<String, dynamic>;
    return data;
  }

  Future<Map<String, dynamic>> getMeWithToken(String token) async {
    return _client.getAuthenticated('$_prefix/me', token: token);
  }

  Future<Map<String, dynamic>> updateMyProfile(
    Map<String, dynamic> body,
  ) async {
    final data = await _client.put('$_prefix/me/profile', data: body);
    return data;
  }

  Future<Map<String, dynamic>> uploadAvatar(String filePath) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath),
    });
    final data = await _client.postMultipart(
      '$_prefix/me/profile/avatar',
      formData: formData,
    );
    return data;
  }

  Future<List<Map<String, dynamic>>> listActiveUsers() async {
    const pageSize = 100;
    final users = <Map<String, dynamic>>[];
    var offset = 0;
    int? total;

    do {
      final data = await _client.get(
        '$_prefix/users',
        queryParameters: {'limit': pageSize, 'offset': offset},
      );

      if (data is List) {
        return data.cast<Map<String, dynamic>>();
      }

      if (data is! Map<String, dynamic>) {
        return users;
      }

      final page = data['data'];
      if (page is! List) {
        return users;
      }
      if (page.isEmpty) {
        return users;
      }

      users.addAll(page.cast<Map<String, dynamic>>());
      total = data['total'] as int?;
      offset += pageSize;
    } while (total != null && users.length < total);

    return users;
  }

  Future<Map<String, dynamic>> getUserBySlug(String slug) async {
    final data =
        await _client.get('$_prefix/users/by-slug/$slug')
            as Map<String, dynamic>;
    return data;
  }

  Future<Map<String, dynamic>> exportMyData() async {
    final data =
        await _client.get('$_prefix/me/export') as Map<String, dynamic>;
    return data;
  }

  Future<MessageResponse> requestDeleteAccount() async {
    final data = await _client.post('$_prefix/me/delete-request');
    return MessageResponse.fromJson(data);
  }

  Future<MessageResponse> confirmDeleteAccount(String token) async {
    final data = await _client.post(
      '$_prefix/me/delete-confirm',
      data: {'token': token},
    );
    return MessageResponse.fromJson(data);
  }
}
