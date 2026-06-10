import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/chat_message.dart';
import '../../data/repositories/chat_repository_impl.dart';

enum ChatSendStatus { idle, sending, polling, done, error }

class ChatState {
  final List<ChatMessage> messages;
  final ChatSendStatus sendStatus;
  final String? pollingTaskId;
  final String? errorMessage;
  final int pollCount;
  final bool historyLoaded;

  const ChatState({
    this.messages = const [],
    this.sendStatus = ChatSendStatus.idle,
    this.pollingTaskId,
    this.errorMessage,
    this.pollCount = 0,
    this.historyLoaded = false,
  });

  bool get isSending =>
      sendStatus == ChatSendStatus.sending ||
      sendStatus == ChatSendStatus.polling;

  ChatState copyWith({
    List<ChatMessage>? messages,
    ChatSendStatus? sendStatus,
    String? pollingTaskId,
    String? errorMessage,
    int? pollCount,
    bool? historyLoaded,
    bool clearPolling = false,
    bool clearError = false,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      sendStatus: sendStatus ?? this.sendStatus,
      pollingTaskId: clearPolling
          ? null
          : (pollingTaskId ?? this.pollingTaskId),
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      pollCount: pollCount ?? this.pollCount,
      historyLoaded: historyLoaded ?? this.historyLoaded,
    );
  }
}

class ChatController extends StateNotifier<ChatState> {
  final ChatRepositoryImpl _repository;
  final String _userId;
  Timer? _pollTimer;

  ChatController({
    required ChatRepositoryImpl repository,
    required String userId,
  }) : _repository = repository,
       _userId = userId,
       super(const ChatState());

  Future<void> loadHistory() async {
    if (state.historyLoaded) return;

    final history = await _repository.loadHistory(_userId);
    state = state.copyWith(messages: history, historyLoaded: true);
  }

  Future<void> reloadHistory() async {
    final history = await _repository.loadHistory(_userId);
    state = state.copyWith(messages: history, historyLoaded: true);
  }

  Future<void> sendMessage(String question) async {
    if (question.trim().isEmpty || state.isSending) return;

    final userMsg = ChatMessage(
      id: const Uuid().v4(),
      role: ChatRole.user,
      content: question.trim(),
      status: ChatMessageStatus.done,
    );

    final assistantMsg = ChatMessage(
      id: const Uuid().v4(),
      role: ChatRole.assistant,
      content: '',
      status: ChatMessageStatus.thinking,
    );

    final allDone = state.messages.where((m) => m.isDone && m.content.isNotEmpty).toList();
    final recent = allDone.length > AppConstants.chatHistoryMaxMessages
        ? allDone.sublist(
            allDone.length - AppConstants.chatHistoryMaxMessages,
          )
        : allDone;
    final history = recent.map((m) => m.toHistoryEntry()).toList();

    state = state.copyWith(
      messages: [...state.messages, userMsg, assistantMsg],
      sendStatus: ChatSendStatus.sending,
      clearError: true,
    );

    await _persistHistory();

    try {
      final result = await _repository.sendQuestion(
        question: question.trim(),
        history: history,
      );

      state = state.copyWith(
        sendStatus: ChatSendStatus.polling,
        pollingTaskId: result.taskId,
      );

      _startPolling(result.taskId);
    } catch (e) {
      _updateAssistantMessage(
        assistantMsg.id,
        status: ChatMessageStatus.error,
        error: e.toString(),
      );
      state = state.copyWith(
        sendStatus: ChatSendStatus.error,
        errorMessage: e.toString(),
      );
      await _persistHistory();
    }
  }

  void _startPolling(String taskId) {
    _cancelPolling();
    state = state.copyWith(pollCount: 0);

    _pollTimer = Timer.periodic(
      const Duration(seconds: AppConstants.pollIntervalSeconds),
      (_) => _poll(taskId),
    );
  }

  Future<void> _poll(String taskId) async {
    if (state.pollCount >= AppConstants.maxPollRetries) {
      _cancelPolling();
      _updateAssistantMessage(
        _lastAssistantMessage?.id ?? '',
        status: ChatMessageStatus.error,
        error: 'requestTimeout',
      );
      state = state.copyWith(
        sendStatus: ChatSendStatus.error,
        clearPolling: true,
      );
      await _persistHistory();
      return;
    }

    state = state.copyWith(pollCount: state.pollCount + 1);

    try {
      final result = await _repository.pollAnswer(taskId);

      if (result.isDone) {
        _cancelPolling();
        _updateAssistantMessage(
          _lastAssistantMessage?.id ?? '',
          content: result.answer ?? '',
          sources: result.sources,
          status: ChatMessageStatus.done,
        );
        state = state.copyWith(
          sendStatus: ChatSendStatus.done,
          clearPolling: true,
        );
        await _persistHistory();
      } else if (result.isError) {
        _cancelPolling();
        _updateAssistantMessage(
          _lastAssistantMessage?.id ?? '',
          status: ChatMessageStatus.error,
          error: result.error ?? 'An error occurred',
        );
        state = state.copyWith(
          sendStatus: ChatSendStatus.error,
          clearPolling: true,
        );
        await _persistHistory();
      }
    } catch (e) {
      _cancelPolling();
      _updateAssistantMessage(
        _lastAssistantMessage?.id ?? '',
        status: ChatMessageStatus.error,
        error: e.toString(),
      );
      state = state.copyWith(
        sendStatus: ChatSendStatus.error,
        clearPolling: true,
      );
      await _persistHistory();
    }
  }

  void _cancelPolling() {
    _pollTimer?.cancel();
    _pollTimer = null;
  }

  void _updateAssistantMessage(
    String messageId, {
    String? content,
    List<SourceChunk>? sources,
    ChatMessageStatus? status,
    String? error,
  }) {
    final updated = state.messages.map((m) {
      if (m.id == messageId) {
        return m.copyWith(
          content: content ?? m.content,
          sources: sources ?? m.sources,
          status: status ?? m.status,
          error: error,
        );
      }
      return m;
    }).toList();

    state = state.copyWith(messages: updated);
  }

  ChatMessage? get _lastAssistantMessage {
    for (var i = state.messages.length - 1; i >= 0; i--) {
      if (state.messages[i].isAssistant) return state.messages[i];
    }
    return null;
  }

  Future<void> clearChat() async {
    _cancelPolling();
    await _repository.clearHistory(_userId);
    state = state.copyWith(
      messages: const [],
      sendStatus: ChatSendStatus.idle,
      clearPolling: true,
      clearError: true,
    );
  }

  Future<void> _persistHistory() async {
    await _repository.saveHistory(_userId, state.messages);
  }

  @override
  void dispose() {
    _cancelPolling();
    super.dispose();
  }
}
