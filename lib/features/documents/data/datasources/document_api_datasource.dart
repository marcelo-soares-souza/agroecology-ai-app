import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../../../core/http/api_client.dart';

class DocumentApiDataSource {
  final ApiClient _client;
  final String _apiBaseUrl;

  DocumentApiDataSource(this._client, this._apiBaseUrl);

  Future<Map<String, dynamic>> listPage({
    String? query,
    bool fullMetadata = false,
    int limit = 50,
    int offset = 0,
  }) async {
    final params = <String, dynamic>{'limit': limit, 'offset': offset};
    if (query != null && query.trim().isNotEmpty) {
      params['q'] = query.trim();
    }
    if (fullMetadata) params['full_metadata'] = true;

    final data = await _client.get(
      '/api/v1/documents',
      queryParameters: params,
    );
    if (data is Map<String, dynamic>) return data;
    return {
      'data': data is List ? data : [],
      'total': 0,
      'limit': limit,
      'offset': offset,
    };
  }

  Future<List<Map<String, dynamic>>> listAll() async {
    const pageSize = 100;
    final documents = <Map<String, dynamic>>[];
    var offset = 0;
    int? total;

    do {
      final data = await listPage(limit: pageSize, offset: offset);

      final page = data['data'];
      if (page is! List) {
        return documents;
      }
      if (page.isEmpty) {
        return documents;
      }

      documents.addAll(page.cast<Map<String, dynamic>>());
      total = data['total'] as int?;
      offset += pageSize;
    } while (total != null && documents.length < total);

    return documents;
  }

  Future<Map<String, dynamic>> getOne(String id) async {
    final data = await _client.get('/api/v1/documents/$id');
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
