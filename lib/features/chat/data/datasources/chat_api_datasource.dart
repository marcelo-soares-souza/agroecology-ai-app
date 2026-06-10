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
}
