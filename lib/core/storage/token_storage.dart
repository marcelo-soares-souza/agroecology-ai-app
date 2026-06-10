import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/app_constants.dart';

class TokenStorage {
  final FlutterSecureStorage _storage;

  TokenStorage() : _storage = const FlutterSecureStorage();

  Future<String?> getAccessToken() =>
      _storage.read(key: AppConstants.tokenStorageAccessKey);

  Future<String?> getRefreshToken() =>
      _storage.read(key: AppConstants.tokenStorageRefreshKey);

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
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
    await _storage.delete(key: AppConstants.tokenStorageAccessKey);
    await _storage.delete(key: AppConstants.tokenStorageRefreshKey);
  }
}
