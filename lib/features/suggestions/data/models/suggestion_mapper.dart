import '../../domain/entities/document_suggestion.dart';

class SuggestionMapper {
  static DocumentSuggestion fromJson(Map<String, dynamic> json) {
    return DocumentSuggestion(
      id: json['id'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      userName: json['user_name'] as String?,
      status: _parseStatus(json['status'] as String? ?? 'pending'),
      title: json['title'] as String?,
      authors: json['authors'] as String?,
      url: json['url'] as String?,
      userComment: json['user_comment'] as String? ?? '',
      adminComment: json['admin_comment'] as String?,
      originalFilename: json['original_filename'] as String?,
      fileType: json['file_type'] as String?,
      fileSize: json['file_size'] as int?,
      documentId: json['document_id'] as String?,
      ingested: json['ingested'] as bool? ?? false,
      reviewedBy: json['reviewed_by'] as String?,
      reviewedAt: json['reviewed_at'] as String?,
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );
  }

  static SuggestionStatus _parseStatus(String status) {
    return switch (status) {
      'approved' => SuggestionStatus.approved,
      'rejected' => SuggestionStatus.rejected,
      _ => SuggestionStatus.pending,
    };
  }
}
