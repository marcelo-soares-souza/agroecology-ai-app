import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../bootstrap/providers.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/chat_conversation.dart';
import '../controllers/chat_controller.dart';
import '../widgets/chat_composer.dart';
import '../widgets/chat_message_widget.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

String _resolveChatError(AppLocalizations l10n, String message) {
  return switch (message) {
    'chatConversationLimitReached' => l10n.chatConversationLimitReached,
    'connectionError' => l10n.connectionError,
    'requestTimeout' => l10n.requestTimeout,
    'chatError' => l10n.chatError,
    _ => message,
  };
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final _scrollController = ScrollController();
  bool _historyLoaded = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(chatControllerProvider.notifier).loadHistory();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_historyLoaded) {
      ref.read(chatControllerProvider.notifier).loadHistory();
      _historyLoaded = true;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final chatState = ref.watch(chatControllerProvider);
    final locale = ref.watch(localeProvider);
    final messages = chatState.messages;

    ref.listen<ChatState>(chatControllerProvider, (previous, next) {
      final message = next.errorMessage;
      if (message == null || message == previous?.errorMessage) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_resolveChatError(l10n, message)),
          behavior: SnackBarBehavior.floating,
        ),
      );
    });

    if (messages.isNotEmpty) {
      _scrollToBottom();
    }

    return Column(
      children: [
        _buildHeader(l10n, chatState),
        Expanded(
          child: chatState.conversationsLoading || chatState.conversationLoading
              ? const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                )
              : messages.isEmpty
              ? _buildEmptyState(l10n)
              : ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return ChatMessageWidget(message: messages[index]);
                  },
                ),
        ),
        ChatComposer(
          hint: l10n.askPlaceholder,
          sendTooltip: l10n.sendQuestionTooltip,
          enabled: !chatState.isBusy,
          onSend: (text) {
            ref
                .read(chatControllerProvider.notifier)
                .sendMessage(text, locale: locale);
          },
        ),
      ],
    );
  }

  Widget _buildHeader(AppLocalizations l10n, ChatState state) {
    final activeConversation = state.activeConversation;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          bottom: BorderSide(color: AppColors.primary100, width: 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
        child: Row(
          children: [
            Expanded(
              child: TextButton.icon(
                onPressed: state.isSending
                    ? null
                    : () => _showConversationHistory(l10n, state),
                icon: const Icon(Icons.history, size: 18),
                label: Text(
                  activeConversation?.title ?? l10n.chatConversations,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Tooltip(
              message: l10n.newChatTooltip,
              triggerMode: TooltipTriggerMode.tap,
              child: IconButton(
                onPressed: state.isBusy
                    ? null
                    : () => ref
                          .read(chatControllerProvider.notifier)
                          .newConversation(l10n.newChat),
                icon: state.creatingConversation
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.primary,
                        ),
                      )
                    : const Icon(Icons.add),
                tooltip: l10n.newChat,
              ),
            ),
            IconButton(
              onPressed: activeConversation == null || state.isBusy
                  ? null
                  : () => _confirmDeleteConversation(l10n, activeConversation),
              icon:
                  state.deletingConversationId != null &&
                      state.deletingConversationId == activeConversation?.id
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.error,
                      ),
                    )
                  : const Icon(Icons.delete_outline),
              tooltip: l10n.deleteChatConversation,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showConversationHistory(
    AppLocalizations l10n,
    ChatState state,
  ) async {
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        final conversations = state.conversations;
        final maxListHeight = MediaQuery.sizeOf(context).height * 0.55;
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        l10n.chatConversations,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: state.isBusy
                          ? null
                          : () {
                              Navigator.pop(context);
                              ref
                                  .read(chatControllerProvider.notifier)
                                  .newConversation(l10n.newChat);
                            },
                      icon: const Icon(Icons.add, size: 16),
                      label: Text(l10n.newChat),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (conversations.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      l10n.noChatConversations,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: AppTokens.bodySmallSize,
                      ),
                    ),
                  )
                else
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: maxListHeight),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: conversations.length,
                      separatorBuilder: (_, _) =>
                          const Divider(height: 1, color: AppColors.primary100),
                      itemBuilder: (context, index) {
                        final conversation = conversations[index];
                        final selected =
                            conversation.id == state.activeConversationId;
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          selected: selected,
                          leading: Icon(
                            selected
                                ? Icons.chat_bubble
                                : Icons.chat_bubble_outline,
                            color: selected
                                ? AppColors.primary
                                : AppColors.textSecondary,
                          ),
                          title: Text(
                            conversation.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            _conversationSubtitle(l10n, conversation),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline),
                            tooltip: l10n.deleteChatConversation,
                            onPressed: state.isBusy
                                ? null
                                : () {
                                    Navigator.pop(context);
                                    _confirmDeleteConversation(
                                      l10n,
                                      conversation,
                                    );
                                  },
                          ),
                          onTap: state.isBusy
                              ? null
                              : () {
                                  Navigator.pop(context);
                                  ref
                                      .read(chatControllerProvider.notifier)
                                      .openConversation(conversation.id);
                                },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _confirmDeleteConversation(
    AppLocalizations l10n,
    ChatConversation conversation,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.deleteChatConversation),
        content: Text(l10n.deleteChatConversationConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;
    await ref
        .read(chatControllerProvider.notifier)
        .deleteConversation(conversation.id);
  }

  String _conversationSubtitle(
    AppLocalizations l10n,
    ChatConversation conversation,
  ) {
    final preview = conversation.lastMessagePreview;
    final date = _formatConversationDate(conversation.lastMessageAt);
    if (preview == null || preview.trim().isEmpty) {
      return date;
    }
    return '$date · $preview';
  }

  String _formatConversationDate(DateTime value) {
    final local = value.toLocal();
    final day = local.day.toString().padLeft(2, '0');
    final month = local.month.toString().padLeft(2, '0');
    final hour = local.hour.toString().padLeft(2, '0');
    final minute = local.minute.toString().padLeft(2, '0');
    return '$day/$month $hour:$minute';
  }

  Widget _buildEmptyState(AppLocalizations l10n) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 40,
              color: AppColors.primary200,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.chatEmptyTitle,
              style: const TextStyle(
                fontSize: AppTokens.bodySize,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              l10n.chatEmptySubtitle,
              style: const TextStyle(
                fontSize: AppTokens.bodySmallSize,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
