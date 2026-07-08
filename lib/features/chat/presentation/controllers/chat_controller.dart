import 'dart:async';
// ignore_for_file: prefer_initializing_formals

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constants/app_constants.dart';
import '../../data/repositories/chat_repository_impl.dart';
import '../../domain/entities/chat_conversation.dart';
import '../../domain/entities/chat_message.dart';

enum ChatSendStatus { idle, sending, polling, done, error }

class ChatState {
  final List<ChatMessage> messages;
  final List<ChatConversation> conversations;
  final String? activeConversationId;
  final ChatSendStatus sendStatus;
  final String? pollingTaskId;
  final String? errorMessage;
  final int pollCount;
  final bool historyLoaded;
  final bool conversationsLoading;
  final bool conversationLoading;
  final bool creatingConversation;
  final String? deletingConversationId;

  const ChatState({
    this.messages = const [],
    this.conversations = const [],
    this.activeConversationId,
    this.sendStatus = ChatSendStatus.idle,
    this.pollingTaskId,
    this.errorMessage,
    this.pollCount = 0,
    this.historyLoaded = false,
    this.conversationsLoading = false,
    this.conversationLoading = false,
    this.creatingConversation = false,
    this.deletingConversationId,
  });

  bool get isSending =>
      sendStatus == ChatSendStatus.sending ||
      sendStatus == ChatSendStatus.polling;

  bool get isBusy =>
      isSending ||
      conversationsLoading ||
      conversationLoading ||
      creatingConversation;

  ChatConversation? get activeConversation {
    final id = activeConversationId;
    if (id == null) return null;
    for (final conversation in conversations) {
      if (conversation.id == id) return conversation;
    }
    return null;
  }

  ChatState copyWith({
    List<ChatMessage>? messages,
    List<ChatConversation>? conversations,
    String? activeConversationId,
    ChatSendStatus? sendStatus,
    String? pollingTaskId,
    String? errorMessage,
    int? pollCount,
    bool? historyLoaded,
    bool? conversationsLoading,
    bool? conversationLoading,
    bool? creatingConversation,
    String? deletingConversationId,
    bool clearActiveConversation = false,
    bool clearPolling = false,
    bool clearError = false,
    bool clearDeletingConversation = false,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      conversations: conversations ?? this.conversations,
      activeConversationId: clearActiveConversation
          ? null
          : (activeConversationId ?? this.activeConversationId),
      sendStatus: sendStatus ?? this.sendStatus,
      pollingTaskId: clearPolling
          ? null
          : (pollingTaskId ?? this.pollingTaskId),
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      pollCount: pollCount ?? this.pollCount,
      historyLoaded: historyLoaded ?? this.historyLoaded,
      conversationsLoading: conversationsLoading ?? this.conversationsLoading,
      conversationLoading: conversationLoading ?? this.conversationLoading,
      creatingConversation: creatingConversation ?? this.creatingConversation,
      deletingConversationId: clearDeletingConversation
          ? null
          : (deletingConversationId ?? this.deletingConversationId),
    );
  }
}

class ChatController extends StateNotifier<ChatState> {
  final ChatRepositoryImpl _repository;
  final String _userId;
  Timer? _pollTimer;
  int _historyLoadGeneration = 0;

  ChatController({
    required ChatRepositoryImpl repository,
    required String userId,
  }) : _repository = repository,
       _userId = userId,
       super(const ChatState());

  Future<void> loadHistory() async {
    if (state.historyLoaded || state.conversationsLoading) return;
    await _loadConversations(selectFirst: true);
  }

  Future<void> reloadHistory() async {
    await _loadConversations(
      selectFirst: state.activeConversationId == null,
      preferredConversationId: state.activeConversationId,
    );
  }

  Future<void> _loadConversations({
    required bool selectFirst,
    String? preferredConversationId,
  }) async {
    final generation = _historyLoadGeneration;
    state = state.copyWith(conversationsLoading: true, clearError: true);
    try {
      final conversations = await _repository.listConversations();
      if (generation != _historyLoadGeneration) return;

      final selectedId =
          preferredConversationId ??
          (selectFirst && conversations.isNotEmpty
              ? conversations.first.id
              : null);

      if (selectedId == null) {
        state = state.copyWith(
          conversations: conversations,
          messages: const [],
          historyLoaded: true,
          conversationsLoading: false,
          clearActiveConversation: true,
        );
        return;
      }

      final detail = await _repository.getConversation(selectedId);
      if (generation != _historyLoadGeneration) return;
      state = state.copyWith(
        conversations: _replaceConversation(conversations, detail.conversation),
        activeConversationId: detail.conversation.id,
        messages: detail.messages,
        historyLoaded: true,
        conversationsLoading: false,
      );
    } catch (e) {
      final legacyHistory = await _repository.loadHistory(_userId);
      if (generation != _historyLoadGeneration) return;
      state = state.copyWith(
        messages: legacyHistory,
        historyLoaded: true,
        conversationsLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> openConversation(String conversationId) async {
    if (state.isSending || state.activeConversationId == conversationId) return;

    final generation = ++_historyLoadGeneration;
    state = state.copyWith(
      conversationLoading: true,
      activeConversationId: conversationId,
      messages: const [],
      clearError: true,
    );
    try {
      final detail = await _repository.getConversation(conversationId);
      if (generation != _historyLoadGeneration) return;
      state = state.copyWith(
        conversations: _replaceConversation(
          state.conversations,
          detail.conversation,
        ),
        activeConversationId: detail.conversation.id,
        messages: detail.messages,
        conversationLoading: false,
      );
    } catch (e) {
      if (generation != _historyLoadGeneration) return;
      state = state.copyWith(
        conversationLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> newConversation(String title) async {
    if (state.isSending || state.creatingConversation) return;
    if (state.activeConversation?.messageCount == 0 && state.messages.isEmpty) {
      return;
    }

    final generation = ++_historyLoadGeneration;
    state = state.copyWith(creatingConversation: true, clearError: true);
    try {
      final conversation = await _repository.createConversation(title);
      if (generation != _historyLoadGeneration) return;
      state = state.copyWith(
        conversations: _prependConversation(state.conversations, conversation),
        activeConversationId: conversation.id,
        messages: const [],
        creatingConversation: false,
      );
    } catch (e) {
      if (generation != _historyLoadGeneration) return;
      state = state.copyWith(
        creatingConversation: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> deleteConversation(String conversationId) async {
    if (state.isSending || state.deletingConversationId != null) return;

    state = state.copyWith(
      deletingConversationId: conversationId,
      clearError: true,
    );
    try {
      await _repository.deleteConversation(conversationId);
      final remaining = state.conversations
          .where((conversation) => conversation.id != conversationId)
          .toList();

      if (state.activeConversationId != conversationId) {
        state = state.copyWith(
          conversations: remaining,
          clearDeletingConversation: true,
        );
        return;
      }

      if (remaining.isEmpty) {
        _historyLoadGeneration++;
        state = state.copyWith(
          conversations: const [],
          messages: const [],
          clearActiveConversation: true,
          clearDeletingConversation: true,
        );
        return;
      }

      final next = remaining.first;
      state = state.copyWith(
        conversations: remaining,
        messages: const [],
        clearActiveConversation: true,
        clearDeletingConversation: true,
      );
      await openConversation(next.id);
    } catch (e) {
      state = state.copyWith(
        errorMessage: e.toString(),
        clearDeletingConversation: true,
      );
    }
  }

  Future<void> sendMessage(String question, {String? locale}) async {
    final cleanQuestion = question.trim();
    if (cleanQuestion.isEmpty || state.isSending) return;

    state = state.copyWith(clearError: true);
    try {
      await _ensureActiveConversation(cleanQuestion);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
      return;
    }

    final activeConversationId = state.activeConversationId;
    if (activeConversationId == null) return;

    final shouldRename = state.activeConversation?.messageCount == 0;
    final userMsg = ChatMessage(
      id: const Uuid().v4(),
      role: ChatRole.user,
      content: cleanQuestion,
      status: ChatMessageStatus.done,
    );

    final assistantMsg = ChatMessage(
      id: const Uuid().v4(),
      role: ChatRole.assistant,
      content: '',
      status: ChatMessageStatus.thinking,
    );

    state = state.copyWith(
      messages: [...state.messages, userMsg, assistantMsg],
      conversations: _touchConversation(
        state.conversations,
        activeConversationId,
        title: shouldRename ? _titleFromQuestion(cleanQuestion) : null,
        messageCountDelta: 2,
        lastMessagePreview: cleanQuestion,
      ),
      sendStatus: ChatSendStatus.sending,
      clearError: true,
    );

    try {
      final result = await _repository.sendQuestion(
        question: cleanQuestion,
        history: const [],
        conversationId: activeConversationId,
        locale: locale,
      );

      if (shouldRename) {
        try {
          await _renameConversation(
            activeConversationId,
            _titleFromQuestion(cleanQuestion),
          );
        } catch (_) {}
      }

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
      await _refreshConversationList();
    }
  }

  Future<void> _ensureActiveConversation(String question) async {
    if (state.activeConversationId != null) return;
    final conversation = await _repository.createConversation(
      _titleFromQuestion(question),
    );
    state = state.copyWith(
      conversations: _prependConversation(state.conversations, conversation),
      activeConversationId: conversation.id,
      messages: const [],
      historyLoaded: true,
    );
  }

  Future<void> _renameConversation(String conversationId, String title) async {
    final updated = await _repository.renameConversation(
      conversationId: conversationId,
      title: title,
    );
    state = state.copyWith(
      conversations: _replaceConversation(state.conversations, updated),
    );
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
      await _refreshConversationList();
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
        await _refreshConversationList();
      } else if (result.isError) {
        _cancelPolling();
        _updateAssistantMessage(
          _lastAssistantMessage?.id ?? '',
          status: ChatMessageStatus.error,
          error: result.error ?? 'chatError',
        );
        state = state.copyWith(
          sendStatus: ChatSendStatus.error,
          clearPolling: true,
        );
        await _refreshConversationList();
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
      await _refreshConversationList();
    }
  }

  Future<void> _refreshConversationList() async {
    try {
      final conversations = await _repository.listConversations();
      state = state.copyWith(conversations: conversations);
    } catch (_) {}
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
    _historyLoadGeneration++;
    await _repository.clearHistory(_userId);
    state = state.copyWith(
      messages: const [],
      sendStatus: ChatSendStatus.idle,
      clearPolling: true,
      clearError: true,
      historyLoaded: true,
      clearActiveConversation: true,
    );
  }

  List<ChatConversation> _prependConversation(
    List<ChatConversation> conversations,
    ChatConversation conversation,
  ) {
    return [
      conversation,
      ...conversations.where((item) => item.id != conversation.id),
    ];
  }

  List<ChatConversation> _replaceConversation(
    List<ChatConversation> conversations,
    ChatConversation conversation,
  ) {
    var replaced = false;
    final updated = conversations.map((item) {
      if (item.id != conversation.id) return item;
      replaced = true;
      return conversation;
    }).toList();
    if (!replaced) updated.insert(0, conversation);
    updated.sort((a, b) => b.lastMessageAt.compareTo(a.lastMessageAt));
    return updated;
  }

  List<ChatConversation> _touchConversation(
    List<ChatConversation> conversations,
    String conversationId, {
    String? title,
    int messageCountDelta = 0,
    String? lastMessagePreview,
  }) {
    final now = DateTime.now();
    return conversations.map((conversation) {
      if (conversation.id != conversationId) return conversation;
      return conversation.copyWith(
        title: title,
        messageCount: conversation.messageCount + messageCountDelta,
        lastMessagePreview: lastMessagePreview,
        updatedAt: now,
        lastMessageAt: now,
      );
    }).toList()..sort((a, b) => b.lastMessageAt.compareTo(a.lastMessageAt));
  }

  String _titleFromQuestion(String question) {
    final normalized = question.trim().replaceAll(RegExp(r'\s+'), ' ');
    if (normalized.length <= 80) return normalized;
    return '${normalized.substring(0, 77).trimRight()}...';
  }

  @override
  void dispose() {
    _cancelPolling();
    super.dispose();
  }
}
