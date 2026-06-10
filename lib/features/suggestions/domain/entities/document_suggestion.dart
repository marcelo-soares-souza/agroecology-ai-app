enum SuggestionStatus { pending, approved, rejected }

class DocumentSuggestion {
  final String id;
  final String userId;
  final String? userName;
  final SuggestionStatus status;
  final String? title;
  final String? authors;
  final String? url;
  final String userComment;
  final String? adminComment;
  final String? originalFilename;
  final String? fileType;
  final int? fileSize;
  final String? documentId;
  final bool ingested;
  final String? reviewedBy;
  final String? reviewedAt;
  final String createdAt;
  final String updatedAt;

  const DocumentSuggestion({
    required this.id,
    required this.userId,
    this.userName,
    required this.status,
    this.title,
    this.authors,
    this.url,
    required this.userComment,
    this.adminComment,
    this.originalFilename,
    this.fileType,
    this.fileSize,
    this.documentId,
    this.ingested = false,
    this.reviewedBy,
    this.reviewedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isPending => status == SuggestionStatus.pending;
  bool get isApproved => status == SuggestionStatus.approved;
  bool get isRejected => status == SuggestionStatus.rejected;

  String get displayTitle {
    return title ?? url ?? originalFilename ?? id.substring(0, 8);
  }
}
