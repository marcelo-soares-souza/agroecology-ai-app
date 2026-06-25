import 'dart:typed_data';

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
    String? title,
    String? authors,
    String? url,
  }) async {
    final formFields = <String, dynamic>{
      'user_comment': userComment,
      'file': await MultipartFile.fromFile(filePath),
    };
    if (title != null && title.trim().isNotEmpty) {
      formFields['title'] = title.trim();
    }
    if (authors != null && authors.trim().isNotEmpty) {
      formFields['authors'] = authors.trim();
    }
    if (url != null && url.trim().isNotEmpty) formFields['url'] = url.trim();

    final formData = FormData.fromMap(formFields);
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

  Future<Map<String, dynamic>> update(
    String id, {
    String? title,
    String? authors,
    String? url,
    String? userComment,
  }) async {
    return await _client.put(
      '/api/v1/suggestions/$id',
      data: {
        'title': title?.trim().isEmpty == true ? null : title?.trim(),
        'authors': authors?.trim().isEmpty == true ? null : authors?.trim(),
        'url': url?.trim().isEmpty == true ? null : url?.trim(),
        'user_comment': userComment?.trim().isEmpty == true
            ? null
            : userComment?.trim(),
      },
    );
  }

  Future<Map<String, dynamic>> replaceFile(String id, String filePath) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath),
    });
    return await _client.put('/api/v1/suggestions/$id/file', data: formData);
  }

  Future<Uint8List> fileBytes(String id) async {
    final response = await _client.dio.get(
      '/api/v1/suggestions/$id/view',
      options: Options(responseType: ResponseType.bytes),
    );
    return Uint8List.fromList(response.data as List<int>);
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
