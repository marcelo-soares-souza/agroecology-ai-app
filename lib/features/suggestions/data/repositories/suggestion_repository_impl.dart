import 'dart:typed_data';

import '../../../../core/http/api_client.dart';
import '../../domain/entities/document_suggestion.dart';
import '../../domain/repositories/suggestion_repository.dart';
import '../datasources/suggestion_api_datasource.dart';
import '../models/suggestion_mapper.dart';

class SuggestionRepositoryImpl implements SuggestionRepository {
  final SuggestionApiDataSource _remote;

  SuggestionRepositoryImpl({required ApiClient apiClient})
    : _remote = SuggestionApiDataSource(apiClient);

  @override
  Future<DocumentSuggestion> create({
    required String filePath,
    required String userComment,
    String? title,
    String? authors,
    String? url,
  }) async {
    return _remote.create(
      filePath: filePath,
      userComment: userComment,
      title: title,
      authors: authors,
      url: url,
    );
  }

  @override
  Future<List<DocumentSuggestion>> listMy({String? status}) async {
    final data = await _remote.listMy(status: status);
    return data.map(SuggestionMapper.fromJson).toList();
  }

  @override
  Future<DocumentSuggestion> getOne(String id) async {
    final data = await _remote.getOne(id);
    return SuggestionMapper.fromJson(data);
  }

  @override
  Future<DocumentSuggestion> update(
    String id, {
    String? title,
    String? authors,
    String? url,
    String? userComment,
  }) async {
    final data = await _remote.update(
      id,
      title: title,
      authors: authors,
      url: url,
      userComment: userComment,
    );
    return SuggestionMapper.fromJson(data);
  }

  @override
  Future<DocumentSuggestion> replaceFile(String id, String filePath) async {
    final data = await _remote.replaceFile(id, filePath);
    return SuggestionMapper.fromJson(data);
  }

  @override
  Future<Uint8List> fileBytes(String id) async {
    return _remote.fileBytes(id);
  }

  @override
  Future<void> delete(String id) async {
    await _remote.delete(id);
  }

  @override
  Future<List<DocumentSuggestion>> listPublic(String userId) async {
    final data = await _remote.listPublic(userId);
    return data.map(SuggestionMapper.fromJson).toList();
  }
}
