import '../entities/chat_message.dart';

abstract class ChatRepository {
  Future<AskResult> sendQuestion({
    required String question,
    required List<Map<String, dynamic>> history,
    int topK = 6,
  });

  Future<PollResult> pollAnswer(String taskId);

  Future<List<ChatMessage>> loadHistory(String userId);
  Future<void> saveHistory(String userId, List<ChatMessage> messages);
  Future<void> clearHistory(String userId);
}

class AskResult {
  final String taskId;
  final String status;

  const AskResult({required this.taskId, required this.status});
}

class PollResult {
  final String taskId;
  final String status;
  final String? answer;
  final List<SourceChunk> sources;
  final String? error;

  const PollResult({
    required this.taskId,
    required this.status,
    this.answer,
    this.sources = const [],
    this.error,
  });

  bool get isProcessing => status == 'processing';
  bool get isDone => status == 'done';
  bool get isError => status == 'error';
}
