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
  }) async {
    return _remote.create(filePath: filePath, userComment: userComment);
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
  Future<void> delete(String id) async {
    await _remote.delete(id);
  }

  @override
  Future<List<DocumentSuggestion>> listPublic(String userId) async {
    final data = await _remote.listPublic(userId);
    return data.map(SuggestionMapper.fromJson).toList();
  }
}
