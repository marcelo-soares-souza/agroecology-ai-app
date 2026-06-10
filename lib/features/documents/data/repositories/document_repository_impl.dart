import '../../../../core/http/api_client.dart';
import '../../domain/entities/document_record.dart';
import '../../domain/repositories/document_repository.dart';
import '../datasources/document_api_datasource.dart';
import '../models/document_mapper.dart';

class DocumentRepositoryImpl implements DocumentRepository {
  final DocumentApiDataSource _remote;

  DocumentRepositoryImpl({
    required ApiClient apiClient,
    required String apiBaseUrl,
  }) : _remote = DocumentApiDataSource(apiClient, apiBaseUrl);

  @override
  Future<List<DocumentRecord>> listAll() async {
    final data = await _remote.listAll();
    return data.map(DocumentMapper.fromJson).toList();
  }

  @override
  Future<DocumentRecord> getOne(String id) async {
    final data = await _remote.getOne(id);
    return DocumentMapper.fromJson(data);
  }

  @override
  String getDownloadUrl(String id) {
    return _remote.downloadUrl(id);
  }
}
