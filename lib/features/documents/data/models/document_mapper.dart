import '../../domain/entities/document_record.dart';

class DocumentMapper {
  static DocumentRecord fromJson(Map<String, dynamic> json) {
    return DocumentRecord(
      id: json['id'] as String? ?? '',
      filename: json['filename'] as String? ?? '',
      title: json['title'] as String?,
      authors: json['authors'] as String?,
      url: json['url'] as String?,
      fileType: json['file_type'] as String? ?? '',
      fileSize: json['file_size'] as int? ?? 0,
      directory: json['directory'] as String? ?? '',
      ingested: json['ingested'] as bool? ?? false,
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );
  }
}
