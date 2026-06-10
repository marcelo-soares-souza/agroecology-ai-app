class AskRequestDto {
  final String question;
  final int topK;
  final List<Map<String, dynamic>> history;

  const AskRequestDto({
    required this.question,
    required this.topK,
    this.history = const [],
  });

  Map<String, dynamic> toJson() {
    return {'question': question, 'top_k': topK, 'history': history};
  }
}

class AskResponseDto {
  final String taskId;
  final String status;

  const AskResponseDto({required this.taskId, required this.status});

  factory AskResponseDto.fromJson(Map<String, dynamic> json) {
    return AskResponseDto(
      taskId: json['task_id'] as String,
      status: json['status'] as String? ?? 'processing',
    );
  }
}

class AnswerResponseDto {
  final String taskId;
  final String status;
  final String? answer;
  final List<Map<String, dynamic>> sources;
  final String? error;

  const AnswerResponseDto({
    required this.taskId,
    required this.status,
    this.answer,
    this.sources = const [],
    this.error,
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
    );
  }
}

class HistoryEntryDto {
  final String role;
  final String content;

  const HistoryEntryDto({required this.role, required this.content});

  Map<String, dynamic> toJson() => {'role': role, 'content': content};
}
