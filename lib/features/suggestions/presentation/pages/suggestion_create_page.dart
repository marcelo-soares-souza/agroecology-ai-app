import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../bootstrap/providers.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/ui/components.dart';
import '../../../../l10n/app_localizations.dart';

const _maxFileSize = 50 * 1024 * 1024;

class SuggestionCreatePage extends ConsumerStatefulWidget {
  const SuggestionCreatePage({super.key});

  @override
  ConsumerState<SuggestionCreatePage> createState() =>
      _SuggestionCreatePageState();
}

class _SuggestionCreatePageState extends ConsumerState<SuggestionCreatePage> {
  final _commentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _filePath;
  String? _fileName;
  String? _error;
  bool _submitted = false;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _pickFile() async {
    final l10n = AppLocalizations.of(context)!;

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false,
      );

      if (result == null || result.files.isEmpty) return;

      final file = result.files.first;
      if (file.extension?.toLowerCase() != 'pdf') {
        setState(() => _error = l10n.pdfOnly);
        return;
      }
      if (file.size > _maxFileSize) {
        setState(() => _error = l10n.fileTooLarge(50));
        return;
      }

      setState(() {
        _filePath = file.path;
        _fileName = file.name;
        _error = null;
      });
    } catch (_) {
      setState(() => _error = l10n.pdfOnly);
    }
  }

  Future<void> _submit() async {
    final l10n = AppLocalizations.of(context)!;
    if (!_formKey.currentState!.validate()) return;
    if (_filePath == null) {
      setState(() => _error = l10n.fileRequired);
      return;
    }

    setState(() => _error = null);

    final error = await ref
        .read(suggestionControllerProvider.notifier)
        .create(_filePath!, _commentController.text.trim());

    if (error != null) {
      setState(() => _error = error);
    } else {
      setState(() => _submitted = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.newSuggestion)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: _submitted ? _buildSuccess(l10n) : _buildForm(l10n),
      ),
    );
  }

  Widget _buildSuccess(AppLocalizations l10n) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 48),
        const Icon(Icons.check_circle, size: 64, color: AppColors.success),
        const SizedBox(height: 16),
        Text(
          l10n.suggestionCreated,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        AppButton.primary(
          label: l10n.mySuggestions,
          onPressed: () => context.go('/suggestions'),
        ),
      ],
    );
  }

  Widget _buildForm(AppLocalizations l10n) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PageIntro(
            title: l10n.newSuggestion,
            subtitle: l10n.newSuggestionSubtitle,
            icon: Icons.lightbulb_outline,
          ),
          const SizedBox(height: 4),
          InfoCallout(
            icon: Icons.fact_check_outlined,
            title: l10n.suggestionReviewTitle,
            body: l10n.suggestionReviewBody,
          ),
          const SizedBox(height: 16),
          if (_error != null) ...[
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFfecaca),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 18,
                    color: AppColors.error,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _error!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF991b1b),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
          Tooltip(
            message: l10n.pdfUploadTooltip,
            triggerMode: TooltipTriggerMode.tap,
            child: GestureDetector(
              onTap: _pickFile,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.primary50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _filePath != null
                        ? AppColors.success
                        : AppColors.primary200,
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      _filePath != null
                          ? Icons.check_circle
                          : Icons.cloud_upload_outlined,
                      size: 36,
                      color: _filePath != null
                          ? AppColors.success
                          : AppColors.primary,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _fileName ?? l10n.selectPdf,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: _filePath != null
                            ? AppColors.success
                            : AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.pdfOnly,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _commentController,
            decoration: InputDecoration(
              labelText: l10n.commentLabel,
              hintText: l10n.commentHint,
              helperText: l10n.commentHelper,
              prefixIcon: const Icon(Icons.chat_outlined),
            ),
            maxLines: 4,
            validator: (v) {
              if (v == null || v.trim().isEmpty) return l10n.commentRequired;
              return null;
            },
          ),
          const SizedBox(height: 24),
          AppButton.primary(
            label: l10n.submitSuggestion,
            onPressed: _submit,
            isLoading: ref.watch(suggestionControllerProvider).isLoading,
          ),
        ],
      ),
    );
  }
}
