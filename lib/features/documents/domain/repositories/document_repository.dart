import 'dart:typed_data';

import '../entities/document_record.dart';

class DocumentPage {
  final List<DocumentRecord> documents;
  final int total;
  final int limit;
  final int offset;

  const DocumentPage({
    required this.documents,
    required this.total,
    required this.limit,
    required this.offset,
  });
}

abstract class DocumentRepository {
  Future<List<DocumentRecord>> listAll();
  Future<DocumentPage> listPage({
    String? query,
    bool fullMetadata = false,
    int limit = 50,
    int offset = 0,
  });
  Future<DocumentRecord> getOne(String id);
  Future<Uint8List> downloadBytes(String id);
  String getDownloadUrl(String id);
  String getViewUrl(String id);
}
