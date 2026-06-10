import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/chat_message.dart';

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage message;

  const ChatMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Column(
        crossAxisAlignment: message.isUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          _buildBubble(context),
          if (message.isDone && message.sources.isNotEmpty)
            _SourcesSection(sources: message.sources),
        ],
      ),
    );
  }

  Widget _buildBubble(BuildContext context) {
    if (message.isUser) {
      return Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.primary50,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        child: Text(
          message.content,
          style: const TextStyle(fontSize: 14, color: AppColors.textPrimary),
        ),
      );
    }

    if (message.isThinking) {
      return Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          border: Border.all(color: AppColors.primary100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Thinking...',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      );
    }

    if (message.isError) {
      return Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFfecaca),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 16, color: AppColors.error),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                message.error ?? message.content,
                style: const TextStyle(fontSize: 13, color: Color(0xFF991b1b)),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.85,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        border: Border.all(color: AppColors.primary100),
      ),
      child: MarkdownBody(
        data: message.content,
        selectable: true,
        styleSheet: MarkdownStyleSheet(
          p: const TextStyle(
            fontSize: 14,
            color: AppColors.textPrimary,
            height: 1.5,
          ),
          h1: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
          h2: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
          h3: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
          code: TextStyle(
            fontSize: 13,
            color: AppColors.textPrimary,
            backgroundColor: AppColors.primary50,
          ),
          codeblockDecoration: BoxDecoration(
            color: const Color(0xFF1c1917),
            borderRadius: BorderRadius.circular(12),
          ),
          codeblockPadding: const EdgeInsets.all(12),
          blockquoteDecoration: BoxDecoration(
            color: AppColors.primary50,
            border: Border(
              left: BorderSide(color: AppColors.primary, width: 3),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          blockquotePadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          a: const TextStyle(
            color: AppColors.primary,
            decoration: TextDecoration.underline,
          ),
          listBullet: const TextStyle(color: AppColors.textPrimary),
        ),
      ),
    );
  }
}

class _SourcesSection extends StatefulWidget {
  final List<SourceChunk> sources;

  const _SourcesSection({required this.sources});

  @override
  State<_SourcesSection> createState() => _SourcesSectionState();
}

class _SourcesSectionState extends State<_SourcesSection> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _expanded ? Icons.expand_less : Icons.expand_more,
                  size: 16,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 4),
                Text(
                  'Sources (${widget.sources.length})',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          if (_expanded) ...[
            const SizedBox(height: 8),
            ...widget.sources.take(5).map((source) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: _SourceCard(source: source),
              );
            }),
          ],
        ],
      ),
    );
  }
}

class _SourceCard extends StatelessWidget {
  final SourceChunk source;

  const _SourceCard({required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primary50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primary200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                source.metadata?.searchType == 'vector'
                    ? Icons.search
                    : Icons.article_outlined,
                size: 12,
                color: source.metadata?.searchType == 'vector'
                    ? AppColors.info
                    : AppColors.primary,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  source.metadata?.displayName ?? 'Source',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (source.score > 0)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 1,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary200,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '${(source.score * 100).toStringAsFixed(0)}%',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary700,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            source.text,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
              height: 1.3,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
