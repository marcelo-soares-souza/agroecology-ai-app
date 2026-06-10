import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../bootstrap/providers.dart';
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
    final chatState = ref.watch(chatControllerProvider);
    final messages = chatState.messages;

    if (messages.isNotEmpty) {
      _scrollToBottom();
    }

    return Column(
      children: [
        _buildHeader(context, chatState),
        Expanded(
          child: messages.isEmpty
              ? _buildEmptyState()
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
          enabled: !chatState.isSending,
          onSend: (text) {
            ref.read(chatControllerProvider.notifier).sendMessage(text);
          },
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, ChatState state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          bottom: BorderSide(color: AppColors.primary100, width: 1),
        ),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chat Agroecológico',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Ask questions about agroecology',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          if (state.messages.isNotEmpty)
            TextButton.icon(
              onPressed: state.isSending
                  ? null
                  : () => ref.read(chatControllerProvider.notifier).clearChat(),
              icon: const Icon(Icons.add, size: 16),
              label: const Text('New chat'),
            ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 56,
              color: AppColors.primary200,
            ),
            const SizedBox(height: 16),
            const Text(
              'Ask a question about agroecology',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'The AI answers from the knowledge base,\nkeeping sources traceable.',
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
