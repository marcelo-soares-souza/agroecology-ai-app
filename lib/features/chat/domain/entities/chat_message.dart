enum ChatRole { user, assistant }

enum ChatMessageStatus { sending, thinking, done, error }

class ChatMessage {
  final String id;
  final ChatRole role;
  final String content;
  final List<SourceChunk> sources;
  final ChatMessageStatus status;
  final String? error;
  final int? durationMs;

  const ChatMessage({
    required this.id,
    required this.role,
    required this.content,
    this.sources = const [],
    this.status = ChatMessageStatus.done,
    this.error,
    this.durationMs,
  });

  bool get isUser => role == ChatRole.user;
  bool get isAssistant => role == ChatRole.assistant;
  bool get isThinking => status == ChatMessageStatus.thinking;
  bool get isDone => status == ChatMessageStatus.done;
  bool get isError => status == ChatMessageStatus.error;

  ChatMessage copyWith({
    String? content,
    List<SourceChunk>? sources,
    ChatMessageStatus? status,
    String? error,
    int? durationMs,
  }) {
    return ChatMessage(
      id: id,
      role: role,
      content: content ?? this.content,
      sources: sources ?? this.sources,
      status: status ?? this.status,
      error: error,
      durationMs: durationMs ?? this.durationMs,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role': role.name,
      'content': content,
      'sources': sources.map((s) => s.toJson()).toList(),
      'status': status.name,
      'duration_ms': durationMs,
    };
  }

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'] as String,
      role: ChatRole.values.firstWhere((e) => e.name == json['role']),
      content: json['content'] as String? ?? '',
      sources:
          (json['sources'] as List?)
              ?.map((s) => SourceChunk.fromJson(s as Map<String, dynamic>))
              .toList() ??
          [],
      status: ChatMessageStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => ChatMessageStatus.done,
      ),
      durationMs: json['duration_ms'] as int?,
    );
  }

  Map<String, dynamic> toHistoryEntry() {
    return {
      'role': role == ChatRole.user ? 'user' : 'assistant',
      'content': content,
    };
  }
}

class SourceChunk {
  final String text;
  final double score;
  final String? scoreType;
  final int? rank;
  final SourceMetadata? metadata;

  const SourceChunk({
    required this.text,
    required this.score,
    this.scoreType,
    this.rank,
    this.metadata,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'score': score,
      'score_type': scoreType,
      'rank': rank,
      'metadata': metadata?.toJson(),
    };
  }

  factory SourceChunk.fromJson(Map<String, dynamic> json) {
    return SourceChunk(
      text: json['text'] as String? ?? '',
      score: (json['score'] as num?)?.toDouble() ?? 0.0,
      scoreType: json['score_type'] as String?,
      rank: json['rank'] as int?,
      metadata: json['metadata'] != null
          ? SourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
    );
  }
}

class SourceMetadata {
  final String? source;
  final int? chunkIndex;
  final String? searchType;
  final String? documentId;
  final String? title;
  final int? pageStart;
  final int? pageEnd;
  final String? sectionTitle;

  const SourceMetadata({
    this.source,
    this.chunkIndex,
    this.searchType,
    this.documentId,
    this.title,
    this.pageStart,
    this.pageEnd,
    this.sectionTitle,
  });

  String get displayName {
    return title ?? source?.split('/').last ?? 'Unknown source';
  }

  Map<String, dynamic> toJson() {
    return {
      'source': source,
      'chunk_index': chunkIndex,
      'search_type': searchType,
      'document_id': documentId,
      'title': title,
      'page_start': pageStart,
      'page_end': pageEnd,
      'section_title': sectionTitle,
    };
  }

  factory SourceMetadata.fromJson(Map<String, dynamic> json) {
    return SourceMetadata(
      source: json['source'] as String?,
      chunkIndex: json['chunk_index'] as int?,
      searchType: json['search_type'] as String?,
      documentId: json['document_id'] as String?,
      title: json['title'] as String?,
      pageStart: json['page_start'] as int?,
      pageEnd: json['page_end'] as int?,
      sectionTitle: json['section_title'] as String?,
    );
  }
}
