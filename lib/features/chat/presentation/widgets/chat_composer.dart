import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class ChatComposer extends StatefulWidget {
  final String hint;
  final bool enabled;
  final ValueChanged<String> onSend;

  const ChatComposer({
    super.key,
    required this.hint,
    required this.enabled,
    required this.onSend,
  });

  @override
  State<ChatComposer> createState() => _ChatComposerState();
}

class _ChatComposerState extends State<ChatComposer> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  bool get _isEmpty => _controller.text.trim().isEmpty;

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _send() {
    if (_isEmpty || !widget.enabled) return;
    widget.onSend(_controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      padding: EdgeInsets.only(
        left: 12,
        right: 8,
        top: 8,
        bottom: 8 + bottomInset + bottomPadding,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.primary100, width: 1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              constraints: const BoxConstraints(maxHeight: 120),
              decoration: BoxDecoration(
                color: AppColors.primary50,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.primary200),
              ),
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                enabled: widget.enabled,
                maxLines: null,
                textInputAction: TextInputAction.send,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                ),
                onChanged: (value) {
                  if (value.endsWith('\n')) {
                    _controller.clear();
                    final trimmed = value.trim();
                    if (trimmed.isNotEmpty && widget.enabled) {
                      widget.onSend(trimmed);
                    }
                    return;
                  }
                  setState(() {});
                },
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _isEmpty || !widget.enabled
                  ? AppColors.primary200
                  : AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.send_rounded,
                size: 18,
                color: Colors.white,
              ),
              onPressed: _isEmpty || !widget.enabled ? null : _send,
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}
