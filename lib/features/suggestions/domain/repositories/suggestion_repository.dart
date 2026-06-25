import 'dart:typed_data';

import '../entities/document_suggestion.dart';

abstract class SuggestionRepository {
  Future<DocumentSuggestion> create({
    required String filePath,
    required String userComment,
    String? title,
    String? authors,
    String? url,
  });

  Future<List<DocumentSuggestion>> listMy({String? status});
  Future<DocumentSuggestion> getOne(String id);
  Future<DocumentSuggestion> update(
    String id, {
    String? title,
    String? authors,
    String? url,
    String? userComment,
  });
  Future<DocumentSuggestion> replaceFile(String id, String filePath);
  Future<Uint8List> fileBytes(String id);
  Future<void> delete(String id);
  Future<List<DocumentSuggestion>> listPublic(String userId);
}
