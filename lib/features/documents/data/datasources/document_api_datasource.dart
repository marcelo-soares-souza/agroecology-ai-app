import '../../../../core/http/api_client.dart';

class DocumentApiDataSource {
  final ApiClient _client;
  final String _apiBaseUrl;

  DocumentApiDataSource(this._client, this._apiBaseUrl);

  Future<List<Map<String, dynamic>>> listAll() async {
    final data = await _client.get('/api/v1/documents');
    return List<Map<String, dynamic>>.from(data);
  }

  Future<Map<String, dynamic>> getOne(String id) async {
    return await _client.get('/api/v1/documents/$id') as Map<String, dynamic>;
  }

  String downloadUrl(String id) {
    return '$_apiBaseUrl/api/v1/documents/$id/download';
  }
}
