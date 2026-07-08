import '../../../../core/http/api_client.dart';
import '../models/chat_dtos.dart';

class ChatApiDataSource {
  final ApiClient _client;

  ChatApiDataSource(this._client);

  Future<AskResponseDto> ask(AskRequestDto request) async {
    final data = await _client.post('/api/v1/ask', data: request.toJson());
    return AskResponseDto.fromJson(data);
  }

  Future<AnswerResponseDto> getAnswer(String taskId) async {
    final data =
        await _client.get('/api/v1/answer/$taskId') as Map<String, dynamic>;
    return AnswerResponseDto.fromJson(data);
  }

  Future<ChatConversationListDto> listConversations({
    int limit = 100,
    int offset = 0,
  }) async {
    final data = await _client.get<Map<String, dynamic>>(
      '/api/v1/chat/conversations',
      queryParameters: {'limit': limit, 'offset': offset},
    );
    return ChatConversationListDto.fromJson(data);
  }

  Future<ChatConversationSummaryDto> createConversation(String title) async {
    final data = await _client.post(
      '/api/v1/chat/conversations',
      data: {'title': title},
    );
    return ChatConversationSummaryDto.fromJson(data);
  }

  Future<ChatConversationDetailDto> getConversation(
    String conversationId,
  ) async {
    final data = await _client.get<Map<String, dynamic>>(
      '/api/v1/chat/conversations/$conversationId',
    );
    return ChatConversationDetailDto.fromJson(data);
  }

  Future<ChatConversationSummaryDto> renameConversation({
    required String conversationId,
    required String title,
  }) async {
    final data = await _client.patch(
      '/api/v1/chat/conversations/$conversationId',
      data: {'title': title},
    );
    return ChatConversationSummaryDto.fromJson(data);
  }

  Future<void> deleteConversation(String conversationId) async {
    await _client.delete('/api/v1/chat/conversations/$conversationId');
  }
}
