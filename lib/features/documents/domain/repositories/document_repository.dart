import 'dart:typed_data';

import '../entities/document_record.dart';

abstract class DocumentRepository {
  Future<List<DocumentRecord>> listAll();
  Future<DocumentRecord> getOne(String id);
  Future<Uint8List> downloadBytes(String id);
  String getDownloadUrl(String id);
  String getViewUrl(String id);
}
