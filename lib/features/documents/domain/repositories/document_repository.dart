import '../entities/document_record.dart';

abstract class DocumentRepository {
  Future<List<DocumentRecord>> listAll();
  Future<DocumentRecord> getOne(String id);
  String getDownloadUrl(String id);
}
