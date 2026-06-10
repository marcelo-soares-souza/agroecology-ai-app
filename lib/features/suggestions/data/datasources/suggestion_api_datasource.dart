import 'package:dio/dio.dart';

import '../../../../core/http/api_client.dart';
import '../models/suggestion_mapper.dart';
import '../../domain/entities/document_suggestion.dart';

class SuggestionApiDataSource {
  final ApiClient _client;

  SuggestionApiDataSource(this._client);

  Future<DocumentSuggestion> create({
    required String filePath,
    required String userComment,
  }) async {
    final formData = FormData.fromMap({
      'user_comment': userComment,
      'file': await MultipartFile.fromFile(filePath),
    });
    final data = await _client.postMultipart(
      '/api/v1/suggestions',
      formData: formData,
    );
    return SuggestionMapper.fromJson(data);
  }

  Future<List<Map<String, dynamic>>> listMy({String? status}) async {
    final params = <String, dynamic>{};
    if (status != null) params['status'] = status;
    final data = await _client.get(
      '/api/v1/suggestions',
      queryParameters: params.isNotEmpty ? params : null,
    );
    return List<Map<String, dynamic>>.from(data);
  }

  Future<Map<String, dynamic>> getOne(String id) async {
    return await _client.get('/api/v1/suggestions/$id') as Map<String, dynamic>;
  }

  Future<void> delete(String id) async {
    await _client.delete('/api/v1/suggestions/$id');
  }

  Future<List<Map<String, dynamic>>> listPublic(String userId) async {
    final data = await _client.get(
      '/api/v1/suggestions/public',
      queryParameters: {'user_id': userId},
    );
    return List<Map<String, dynamic>>.from(data);
  }
}
