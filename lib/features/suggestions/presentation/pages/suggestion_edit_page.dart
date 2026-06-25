import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../bootstrap/providers.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/ui/components.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/document_suggestion.dart';

const _maxSuggestionFileSize = 50 * 1024 * 1024;

class SuggestionEditPage extends ConsumerStatefulWidget {
  final String id;

  const SuggestionEditPage({super.key, required this.id});

  @override
  ConsumerState<SuggestionEditPage> createState() => _SuggestionEditPageState();
}

class _SuggestionEditPageState extends ConsumerState<SuggestionEditPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorsController = TextEditingController();
  final _urlController = TextEditingController();
  final _commentController = TextEditingController();
  DocumentSuggestion? _suggestion;
  String? _filePath;
  String? _fileName;
  String? _error;
  bool _loading = true;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorsController.dispose();
    _urlController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final repo = ref.read(suggestionRepositoryProvider);
      final suggestion = await repo.getOne(widget.id);
      _titleController.text = suggestion.title ?? '';
      _authorsController.text = suggestion.authors ?? '';
      _urlController.text = suggestion.url ?? '';
      _commentController.text = suggestion.userComment;
      if (!mounted) return;
      setState(() {
        _suggestion = suggestion;
        _loading = false;
        _error = null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = e.toString();
      });
    }
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
      if (file.size > _maxSuggestionFileSize) {
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

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_suggestion == null || !_suggestion!.isPending) return;

    setState(() {
      _saving = true;
      _error = null;
    });

    try {
      final controller = ref.read(suggestionControllerProvider.notifier);
      var updated = await controller.update(
        widget.id,
        title: _titleController.text,
        authors: _authorsController.text,
        url: _urlController.text,
        userComment: _commentController.text,
      );
      if (_filePath != null) {
        updated = await controller.replaceFile(updated.id, _filePath!);
      }
      if (!mounted) return;
      context.go('/suggestions/${updated.id}');
    } on AppException catch (e) {
      if (!mounted) return;
      setState(() {
        _saving = false;
        _error = e.message;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _saving = false;
        _error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null && _suggestion == null) {
      return ErrorState(message: _error!, onRetry: _load);
    }

    final suggestion = _suggestion;
    if (suggestion == null) {
      return ErrorState(message: l10n.suggestionNotFound, onRetry: _load);
    }

    if (!suggestion.isPending) {
      return ErrorState(message: l10n.suggestionNotEditable, onRetry: _load);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
        title: Text(l10n.editSuggestion),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PageIntro(
                title: l10n.editSuggestion,
                subtitle: l10n.editSuggestionSubtitle,
                icon: Icons.edit_outlined,
              ),
              if (_error != null) ...[
                const SizedBox(height: 16),
                _ErrorMessage(message: _error!),
              ],
              const SizedBox(height: 24),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: l10n.suggestionTitleLabel,
                  hintText: l10n.suggestionTitleHint,
                  helperText: l10n.suggestionTitleHelper,
                  prefixIcon: const Icon(Icons.title),
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _authorsController,
                decoration: InputDecoration(
                  labelText: l10n.suggestionAuthorsLabel,
                  hintText: l10n.suggestionAuthorsHint,
                  helperText: l10n.suggestionAuthorsHelper,
                  prefixIcon: const Icon(Icons.groups_outlined),
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _urlController,
                decoration: InputDecoration(
                  labelText: l10n.suggestionUrlLabel,
                  hintText: l10n.linkHint,
                  helperText: l10n.suggestionUrlHelper,
                  prefixIcon: const Icon(Icons.link),
                ),
                keyboardType: TextInputType.url,
                validator: (value) {
                  final url = value?.trim() ?? '';
                  if (url.isEmpty) return null;
                  if (!url.startsWith('http://') &&
                      !url.startsWith('https://')) {
                    return l10n.linkValidation;
                  }
                  return null;
                },
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
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.commentRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      l10n.currentFile,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _fileName ??
                          suggestion.originalFilename ??
                          l10n.noFileSelected,
                      style: const TextStyle(color: AppColors.textSecondary),
                    ),
                    const SizedBox(height: 12),
                    AppButton.secondary(
                      label: l10n.replacePdf,
                      icon: Icons.upload_file,
                      onPressed: _pickFile,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              AppButton.primary(
                label: l10n.save,
                isLoading: _saving,
                onPressed: _saving ? null : _save,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  final String message;

  const _ErrorMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFfecaca),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, size: 18, color: AppColors.error),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(fontSize: 13, color: Color(0xFF991b1b)),
            ),
          ),
        ],
      ),
    );
  }
}
