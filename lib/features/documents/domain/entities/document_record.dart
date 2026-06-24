class DocumentRecord {
  final String id;
  final String filename;
  final String? title;
  final String? authors;
  final String? url;
  final String fileType;
  final int fileSize;
  final String directory;
  final bool ingested;
  final bool fullFileAvailable;
  final String createdAt;
  final String updatedAt;
  final DocumentAcademicMetadata? academicMetadata;

  const DocumentRecord({
    required this.id,
    required this.filename,
    this.title,
    this.authors,
    this.url,
    required this.fileType,
    required this.fileSize,
    required this.directory,
    required this.ingested,
    this.fullFileAvailable = true,
    required this.createdAt,
    required this.updatedAt,
    this.academicMetadata,
  });

  String get displayTitle => title ?? filename;

  String get displayType {
    return switch (fileType) {
      'pdf' => 'PDF',
      'md' => 'Markdown',
      'txt' => 'Text',
      _ => fileType.toUpperCase(),
    };
  }

  String get displaySize {
    if (fileSize < 1024) {
      return '${fileSize}B';
    }
    if (fileSize < 1024 * 1024) {
      return '${(fileSize / 1024).toStringAsFixed(1)}KB';
    }
    return '${(fileSize / (1024 * 1024)).toStringAsFixed(1)}MB';
  }
}

class DocumentAcademicMetadata {
  final String provider;
  final String? doi;
  final int? publicationYear;
  final String? venue;
  final String? publisher;
  final int? citationCount;
  final int? referenceCount;
  final String? abstractText;
  final String? sourceUrl;
  final String? openAccessUrl;
  final List<String> topics;
  final List<String> keywords;
  final List<String> licenses;
  final List<String> funders;
  final double? matchConfidence;

  const DocumentAcademicMetadata({
    required this.provider,
    this.doi,
    this.publicationYear,
    this.venue,
    this.publisher,
    this.citationCount,
    this.referenceCount,
    this.abstractText,
    this.sourceUrl,
    this.openAccessUrl,
    this.topics = const [],
    this.keywords = const [],
    this.licenses = const [],
    this.funders = const [],
    this.matchConfidence,
  });

  bool get hasContent {
    return doi != null ||
        publicationYear != null ||
        venue != null ||
        publisher != null ||
        citationCount != null ||
        referenceCount != null ||
        abstractText != null ||
        sourceUrl != null ||
        openAccessUrl != null ||
        topics.isNotEmpty ||
        keywords.isNotEmpty ||
        licenses.isNotEmpty ||
        funders.isNotEmpty ||
        matchConfidence != null;
  }
}
