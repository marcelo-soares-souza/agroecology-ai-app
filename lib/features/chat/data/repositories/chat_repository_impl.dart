import '../../../../core/http/api_client.dart';
import '../../../../core/storage/chat_storage.dart';
import '../../domain/entities/chat_conversation.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_api_datasource.dart';
import '../models/chat_dtos.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatApiDataSource _remote;
  final ChatStorage _storage;

  ChatRepositoryImpl({
    required ApiClient apiClient,
    required ChatStorage chatStorage,
  }) : _remote = ChatApiDataSource(apiClient),
       _storage = chatStorage;

  @override
  Future<AskResult> sendQuestion({
    required String question,
    required List<Map<String, dynamic>> history,
    String? conversationId,
    String? locale,
    int topK = 6,
  }) async {
    final response = await _remote.ask(
      AskRequestDto(
        question: question,
        topK: topK,
        history: history,
        conversationId: conversationId,
        locale: locale,
      ),
    );

    return AskResult(
      taskId: response.taskId,
      status: response.status,
      conversationId: response.conversationId,
      userMessageId: response.userMessageId,
      assistantMessageId: response.assistantMessageId,
    );
  }

  @override
  Future<PollResult> pollAnswer(String taskId) async {
    final response = await _remote.getAnswer(taskId);

    return PollResult(
      taskId: response.taskId,
      status: response.status,
      answer: response.answer,
      sources: response.sources.map((s) => SourceChunk.fromJson(s)).toList(),
      error: response.error,
      conversationId: response.conversationId,
      userMessageId: response.userMessageId,
      assistantMessageId: response.assistantMessageId,
    );
  }

  @override
  Future<List<ChatConversation>> listConversations() async {
    final response = await _remote.listConversations();
    return response.data.map(_conversationFromDto).toList();
  }

  @override
  Future<ChatConversation> createConversation(String title) async {
    final response = await _remote.createConversation(title);
    return _conversationFromDto(response);
  }

  @override
  Future<ChatConversationDetail> getConversation(String conversationId) async {
    final response = await _remote.getConversation(conversationId);
    return ChatConversationDetail(
      conversation: _conversationFromDto(response.conversation),
      messages: response.messages.map(_messageFromDto).toList(),
    );
  }

  @override
  Future<ChatConversation> renameConversation({
    required String conversationId,
    required String title,
  }) async {
    final response = await _remote.renameConversation(
      conversationId: conversationId,
      title: title,
    );
    return _conversationFromDto(response);
  }

  @override
  Future<void> deleteConversation(String conversationId) async {
    await _remote.deleteConversation(conversationId);
  }

  @override
  Future<List<ChatMessage>> loadHistory(String userId) async {
    return _storage.loadChatHistory(userId);
  }

  @override
  Future<void> saveHistory(String userId, List<ChatMessage> messages) async {
    return _storage.saveChatHistory(userId, messages);
  }

  @override
  Future<void> clearHistory(String userId) async {
    return _storage.clearChatHistory(userId);
  }

  ChatConversation _conversationFromDto(ChatConversationSummaryDto dto) {
    return ChatConversation(
      id: dto.id,
      title: dto.title,
      status: dto.status,
      messageCount: dto.messageCount,
      lastMessagePreview: dto.lastMessagePreview,
      createdAt: DateTime.parse(dto.createdAt),
      updatedAt: DateTime.parse(dto.updatedAt),
      lastMessageAt: DateTime.parse(dto.lastMessageAt),
    );
  }

  ChatMessage _messageFromDto(ChatConversationMessageDto dto) {
    return ChatMessage(
      id: dto.id,
      role: dto.role == 'user' ? ChatRole.user : ChatRole.assistant,
      content: dto.content,
      sources: dto.sources
          .map((source) => SourceChunk.fromJson(source))
          .toList(),
      status: switch (dto.status) {
        'thinking' => ChatMessageStatus.thinking,
        'error' => ChatMessageStatus.error,
        _ => ChatMessageStatus.done,
      },
      error: dto.error,
      durationMs: dto.durationMs,
    );
  }
}
