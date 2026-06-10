import '../../../../core/http/api_client.dart';
import '../../../../core/storage/chat_storage.dart';
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
    int topK = 6,
  }) async {
    final response = await _remote.ask(
      AskRequestDto(question: question, topK: topK, history: history),
    );

    return AskResult(taskId: response.taskId, status: response.status);
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
    );
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
}
