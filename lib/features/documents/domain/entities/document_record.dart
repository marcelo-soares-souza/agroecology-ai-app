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
  final String createdAt;
  final String updatedAt;

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
    required this.createdAt,
    required this.updatedAt,
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
