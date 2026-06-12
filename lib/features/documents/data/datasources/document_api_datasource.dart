import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../../../core/http/api_client.dart';

class DocumentApiDataSource {
  final ApiClient _client;
  final String _apiBaseUrl;

  DocumentApiDataSource(this._client, this._apiBaseUrl);

  Future<List<Map<String, dynamic>>> listAll() async {
    final response = await _client.dio.get('/api/v1/documents');
    final data = response.data;
    if (data is List) {
      return data.cast<Map<String, dynamic>>();
    }
    return [];
  }

  Future<Map<String, dynamic>> getOne(String id) async {
    final response = await _client.dio.get('/api/v1/documents/$id');
    final data = response.data;
    if (data is Map<String, dynamic>) {
      return data;
    }
    return {};
  }

  Future<Uint8List> downloadBytes(String id) async {
    final response = await _client.dio.get(
      '/api/v1/documents/$id/download',
      options: Options(responseType: ResponseType.bytes),
    );
    return Uint8List.fromList(response.data as List<int>);
  }

  String downloadUrl(String id) {
    return '$_apiBaseUrl/api/v1/documents/$id/download';
  }

  String viewUrl(String id) {
    return '$_apiBaseUrl/api/v1/documents/$id/view';
  }
}
