import 'dart:typed_data';

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
  Future<DocumentPage> listPage({
    String? query,
    bool fullMetadata = false,
    int limit = 50,
    int offset = 0,
  }) async {
    final data = await _remote.listPage(
      query: query,
      fullMetadata: fullMetadata,
      limit: limit,
      offset: offset,
    );
    final items = data['data'] is List
        ? List<Map<String, dynamic>>.from(data['data'] as List)
        : <Map<String, dynamic>>[];

    return DocumentPage(
      documents: items.map(DocumentMapper.fromJson).toList(),
      total: (data['total'] as num?)?.toInt() ?? items.length,
      limit: (data['limit'] as num?)?.toInt() ?? limit,
      offset: (data['offset'] as num?)?.toInt() ?? offset,
    );
  }

  @override
  Future<DocumentRecord> getOne(String id) async {
    final data = await _remote.getOne(id);
    return DocumentMapper.fromJson(data);
  }

  @override
  Future<Uint8List> downloadBytes(String id) async {
    return await _remote.downloadBytes(id);
  }

  @override
  String getDownloadUrl(String id) {
    return _remote.downloadUrl(id);
  }

  @override
  String getViewUrl(String id) {
    return _remote.viewUrl(id);
  }
}
