import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/app_constants.dart';

class TokenStorage {
  final FlutterSecureStorage _storage;
  String? _accessToken;
  String? _refreshToken;

  TokenStorage() : _storage = const FlutterSecureStorage();

  Future<String?> getAccessToken() async {
    _accessToken ??= await _storage.read(
      key: AppConstants.tokenStorageAccessKey,
    );
    return _accessToken;
  }

  Future<String?> getRefreshToken() async {
    _refreshToken ??= await _storage.read(
      key: AppConstants.tokenStorageRefreshKey,
    );
    return _refreshToken;
  }

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    await _storage.write(
      key: AppConstants.tokenStorageAccessKey,
      value: accessToken,
    );
    await _storage.write(
      key: AppConstants.tokenStorageRefreshKey,
      value: refreshToken,
    );
  }

  Future<void> clearTokens() async {
    _accessToken = null;
    _refreshToken = null;
    await _storage.delete(key: AppConstants.tokenStorageAccessKey);
    await _storage.delete(key: AppConstants.tokenStorageRefreshKey);
  }
}
