import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../../../core/http/api_client.dart';

class DocumentApiDataSource {
  final ApiClient _client;
  final String _apiBaseUrl;

  DocumentApiDataSource(this._client, this._apiBaseUrl);

  Future<List<Map<String, dynamic>>> listAll() async {
    const pageSize = 100;
    final documents = <Map<String, dynamic>>[];
    var offset = 0;
    int? total;

    do {
      final data = await _client.get(
        '/api/v1/documents',
        queryParameters: {'limit': pageSize, 'offset': offset},
      );

      if (data is List) {
        return data.cast<Map<String, dynamic>>();
      }

      if (data is! Map<String, dynamic>) {
        return documents;
      }

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
