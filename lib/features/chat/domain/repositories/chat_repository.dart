import '../entities/chat_conversation.dart';
import '../entities/chat_message.dart';

abstract class ChatRepository {
  Future<AskResult> sendQuestion({
    required String question,
    required List<Map<String, dynamic>> history,
    String? conversationId,
    String? locale,
    int topK = 6,
  });

  Future<PollResult> pollAnswer(String taskId);
  Future<List<ChatConversation>> listConversations();
  Future<ChatConversation> createConversation(String title);
  Future<ChatConversationDetail> getConversation(String conversationId);
  Future<ChatConversation> renameConversation({
    required String conversationId,
    required String title,
  });
  Future<void> deleteConversation(String conversationId);

  Future<List<ChatMessage>> loadHistory(String userId);
  Future<void> saveHistory(String userId, List<ChatMessage> messages);
  Future<void> clearHistory(String userId);
}

class AskResult {
  final String taskId;
  final String status;
  final String? conversationId;
  final String? userMessageId;
  final String? assistantMessageId;

  const AskResult({
    required this.taskId,
    required this.status,
    this.conversationId,
    this.userMessageId,
    this.assistantMessageId,
  });
}

class PollResult {
  final String taskId;
  final String status;
  final String? answer;
  final List<SourceChunk> sources;
  final String? error;
  final String? conversationId;
  final String? userMessageId;
  final String? assistantMessageId;

  const PollResult({
    required this.taskId,
    required this.status,
    this.answer,
    this.sources = const [],
    this.error,
    this.conversationId,
    this.userMessageId,
    this.assistantMessageId,
  });

  bool get isProcessing => status == 'processing';
  bool get isDone => status == 'done';
  bool get isError => status == 'error';
}

class ChatConversationDetail {
  final ChatConversation conversation;
  final List<ChatMessage> messages;

  const ChatConversationDetail({
    required this.conversation,
    required this.messages,
  });
}
