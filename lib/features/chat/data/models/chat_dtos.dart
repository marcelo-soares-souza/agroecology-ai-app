class AskRequestDto {
  final String question;
  final int topK;
  final List<Map<String, dynamic>> history;
  final String? conversationId;
  final String? locale;

  const AskRequestDto({
    required this.question,
    required this.topK,
    this.history = const [],
    this.conversationId,
    this.locale,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'top_k': topK,
      'history': history,
      if (conversationId != null && conversationId!.trim().isNotEmpty)
        'conversation_id': conversationId,
      if (locale != null && locale!.trim().isNotEmpty) 'locale': locale,
    };
  }
}

class AskResponseDto {
  final String taskId;
  final String status;
  final String? conversationId;
  final String? userMessageId;
  final String? assistantMessageId;

  const AskResponseDto({
    required this.taskId,
    required this.status,
    this.conversationId,
    this.userMessageId,
    this.assistantMessageId,
  });

  factory AskResponseDto.fromJson(Map<String, dynamic> json) {
    return AskResponseDto(
      taskId: json['task_id'] as String,
      status: json['status'] as String? ?? 'processing',
      conversationId: json['conversation_id'] as String?,
      userMessageId: json['user_message_id'] as String?,
      assistantMessageId: json['assistant_message_id'] as String?,
    );
  }
}

class AnswerResponseDto {
  final String taskId;
  final String status;
  final String? answer;
  final List<Map<String, dynamic>> sources;
  final String? error;
  final String? conversationId;
  final String? userMessageId;
  final String? assistantMessageId;

  const AnswerResponseDto({
    required this.taskId,
    required this.status,
    this.answer,
    this.sources = const [],
    this.error,
    this.conversationId,
    this.userMessageId,
    this.assistantMessageId,
  });

  factory AnswerResponseDto.fromJson(Map<String, dynamic> json) {
    return AnswerResponseDto(
      taskId: json['task_id'] as String,
      status: json['status'] as String? ?? 'processing',
      answer: json['answer'] as String?,
      sources:
          (json['sources'] as List?)
              ?.map((s) => s as Map<String, dynamic>)
              .toList() ??
          [],
      error: json['error'] as String?,
      conversationId: json['conversation_id'] as String?,
      userMessageId: json['user_message_id'] as String?,
      assistantMessageId: json['assistant_message_id'] as String?,
    );
  }
}

class HistoryEntryDto {
  final String role;
  final String content;

  const HistoryEntryDto({required this.role, required this.content});

  Map<String, dynamic> toJson() => {'role': role, 'content': content};
}

class ChatConversationSummaryDto {
  final String id;
  final String title;
  final String status;
  final int messageCount;
  final String? lastMessagePreview;
  final String createdAt;
  final String updatedAt;
  final String lastMessageAt;

  const ChatConversationSummaryDto({
    required this.id,
    required this.title,
    required this.status,
    required this.messageCount,
    this.lastMessagePreview,
    required this.createdAt,
    required this.updatedAt,
    required this.lastMessageAt,
  });

  factory ChatConversationSummaryDto.fromJson(Map<String, dynamic> json) {
    return ChatConversationSummaryDto(
      id: json['id'] as String,
      title: json['title'] as String? ?? '',
      status: json['status'] as String? ?? 'active',
      messageCount: json['message_count'] as int? ?? 0,
      lastMessagePreview: json['last_message_preview'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      lastMessageAt: json['last_message_at'] as String,
    );
  }
}

class ChatConversationMessageDto {
  final String id;
  final String conversationId;
  final String role;
  final String content;
  final String status;
  final String? taskId;
  final List<Map<String, dynamic>> sources;
  final String? error;
  final int? durationMs;
  final String createdAt;

  const ChatConversationMessageDto({
    required this.id,
    required this.conversationId,
    required this.role,
    required this.content,
    required this.status,
    this.taskId,
    this.sources = const [],
    this.error,
    this.durationMs,
    required this.createdAt,
  });

  factory ChatConversationMessageDto.fromJson(Map<String, dynamic> json) {
    return ChatConversationMessageDto(
      id: json['id'] as String,
      conversationId: json['conversation_id'] as String,
      role: json['role'] as String? ?? 'assistant',
      content: json['content'] as String? ?? '',
      status: json['status'] as String? ?? 'done',
      taskId: json['task_id'] as String?,
      sources:
          (json['sources'] as List?)
              ?.map((s) => s as Map<String, dynamic>)
              .toList() ??
          [],
      error: json['error'] as String?,
      durationMs: json['duration_ms'] as int?,
      createdAt: json['created_at'] as String,
    );
  }
}

class ChatConversationDetailDto {
  final ChatConversationSummaryDto conversation;
  final List<ChatConversationMessageDto> messages;

  const ChatConversationDetailDto({
    required this.conversation,
    required this.messages,
  });

  factory ChatConversationDetailDto.fromJson(Map<String, dynamic> json) {
    return ChatConversationDetailDto(
      conversation: ChatConversationSummaryDto.fromJson(
        json['conversation'] as Map<String, dynamic>,
      ),
      messages:
          (json['messages'] as List?)
              ?.map(
                (message) => ChatConversationMessageDto.fromJson(
                  message as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    );
  }
}

class ChatConversationListDto {
  final List<ChatConversationSummaryDto> data;
  final int total;
  final int limit;
  final int offset;

  const ChatConversationListDto({
    required this.data,
    required this.total,
    required this.limit,
    required this.offset,
  });

  factory ChatConversationListDto.fromJson(Map<String, dynamic> json) {
    return ChatConversationListDto(
      data:
          (json['data'] as List?)
              ?.map(
                (conversation) => ChatConversationSummaryDto.fromJson(
                  conversation as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
      total: json['total'] as int? ?? 0,
      limit: json['limit'] as int? ?? 0,
      offset: json['offset'] as int? ?? 0,
    );
  }
}
