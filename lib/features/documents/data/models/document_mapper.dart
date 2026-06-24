import '../../domain/entities/document_record.dart';

class DocumentMapper {
  static final _blockFullPdfLicensePatterns = [
    RegExp(r'elsevier\.com', caseSensitive: false),
    RegExp(r'springer', caseSensitive: false),
    RegExp(r'wiley', caseSensitive: false),
    RegExp(r'cambridge\.org', caseSensitive: false),
    RegExp(r'sagepub\.com', caseSensitive: false),
  ];

  static DocumentRecord fromJson(Map<String, dynamic> json) {
    final academicMetadataJson = _asMap(json['academic_metadata']);
    final academicMetadata = academicMetadataJson == null
        ? null
        : _academicMetadataFromJson(academicMetadataJson);
    final fileType = json['file_type'] as String? ?? '';
    final fullFileAvailable =
        json['full_file_available'] as bool? ??
        !_isFullFileAccessBlocked(fileType, academicMetadataJson?['license']);

    return DocumentRecord(
      id: json['id'] as String? ?? '',
      filename: json['filename'] as String? ?? '',
      title: json['title'] as String?,
      authors: json['authors'] as String?,
      url: json['url'] as String?,
      fileType: fileType,
      fileSize: (json['file_size'] as num?)?.toInt() ?? 0,
      directory: json['directory'] as String? ?? '',
      ingested: json['ingested'] as bool? ?? false,
      fullFileAvailable: fullFileAvailable,
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      academicMetadata: academicMetadata?.hasContent == true
          ? academicMetadata
          : null,
    );
  }

  static DocumentAcademicMetadata _academicMetadataFromJson(
    Map<String, dynamic> json,
  ) {
    return DocumentAcademicMetadata(
      provider: json['provider'] as String? ?? '',
      doi: json['doi'] as String?,
      publicationYear: (json['publication_year'] as num?)?.toInt(),
      venue: json['venue'] as String?,
      publisher: json['publisher'] as String?,
      citationCount: (json['citation_count'] as num?)?.toInt(),
      referenceCount: (json['reference_count'] as num?)?.toInt(),
      abstractText: json['abstract'] as String?,
      sourceUrl: json['source_url'] as String?,
      openAccessUrl: json['open_access_url'] as String?,
      topics: _metadataListLabels(json['topics']),
      keywords: _metadataListLabels(json['keywords']),
      licenses: _metadataListLabels(json['license']),
      funders: _metadataListLabels(json['funder']),
      matchConfidence: (json['match_confidence'] as num?)?.toDouble(),
    );
  }

  static Map<String, dynamic>? _asMap(dynamic value) {
    if (value is Map<String, dynamic>) return value;
    if (value is! Map) return null;
    return value.map((key, value) => MapEntry(key.toString(), value));
  }

  static List<String> _metadataListLabels(dynamic value) {
    if (value == null) return [];

    final items = value is List ? value : [value];
    return items
        .map(_metadataLabel)
        .whereType<String>()
        .where((label) => label.trim().isNotEmpty)
        .take(6)
        .toList();
  }

  static String? _metadataLabel(dynamic value) {
    if (value is String) return value;
    final item = _asMap(value);
    if (item == null) return null;

    for (final key in ['display_name', 'name', 'award', 'URL', 'url', 'DOI']) {
      final label = item[key];
      if (label is String) return label;
    }
    return null;
  }

  static bool _isFullFileAccessBlocked(String fileType, dynamic licenseValue) {
    if (fileType != 'pdf' || licenseValue == null) return false;

    return _iterLicenseUrls(licenseValue).any(
      (url) =>
          _blockFullPdfLicensePatterns.any((pattern) => pattern.hasMatch(url)),
    );
  }

  static Iterable<String> _iterLicenseUrls(dynamic value) sync* {
    if (value is String) {
      yield value;
      return;
    }

    final item = _asMap(value);
    if (item != null) {
      for (final entry in item.entries) {
        if (entry.key.toLowerCase() == 'url' && entry.value is String) {
          yield entry.value as String;
        } else if (entry.value is Map || entry.value is List) {
          yield* _iterLicenseUrls(entry.value);
        }
      }
      return;
    }

    if (value is List) {
      for (final item in value) {
        yield* _iterLicenseUrls(item);
      }
    }
  }
}
