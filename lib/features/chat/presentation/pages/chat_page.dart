import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../bootstrap/providers.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/theme/app_theme.dart';
import '../controllers/chat_controller.dart';
import '../widgets/chat_composer.dart';
import '../widgets/chat_message_widget.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
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
    final messages = chatState.messages;

    if (messages.isNotEmpty) {
      _scrollToBottom();
    }

    return Column(
      children: [
        _buildHeader(l10n, chatState),
        Expanded(
          child: messages.isEmpty
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
          enabled: !chatState.isSending,
          onSend: (text) {
            ref.read(chatControllerProvider.notifier).sendMessage(text);
          },
        ),
      ],
    );
  }

  Widget _buildHeader(AppLocalizations l10n, ChatState state) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          bottom: BorderSide(color: AppColors.primary100, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              children: [
                const Spacer(),
                Tooltip(
                  message: l10n.newChatTooltip,
                  triggerMode: TooltipTriggerMode.tap,
                  child: TextButton.icon(
                    onPressed: state.isSending
                        ? null
                        : () => ref
                              .read(chatControllerProvider.notifier)
                              .clearChat(),
                    icon: const Icon(Icons.add, size: 16),
                    label: Text(l10n.newChat),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
