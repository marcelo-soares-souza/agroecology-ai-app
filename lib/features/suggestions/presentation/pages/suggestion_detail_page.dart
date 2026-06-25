import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:go_router/go_router.dart';

import '../../../../bootstrap/providers.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/ui/components.dart';
import '../../../../core/utils/external_link.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/document_suggestion.dart';

class SuggestionDetailPage extends ConsumerStatefulWidget {
  final String id;

  const SuggestionDetailPage({super.key, required this.id});

  @override
  ConsumerState<SuggestionDetailPage> createState() =>
      _SuggestionDetailPageState();
}

class _SuggestionDetailPageState extends ConsumerState<SuggestionDetailPage> {
  DocumentSuggestion? _suggestion;
  String? _error;
  String? _pdfFilePath;
  bool _pdfLoading = false;
  String? _pdfError;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final repo = ref.read(suggestionRepositoryProvider);
      final suggestion = await repo.getOne(widget.id);
      setState(() {
        _suggestion = suggestion;
        _error = null;
      });
      if (suggestion.fileType == 'pdf' && suggestion.originalFilename != null) {
        _loadPdf(suggestion.id);
      }
    } catch (e) {
      setState(() => _error = e.toString());
    }
  }

  Future<void> _loadPdf(String suggestionId) async {
    setState(() {
      _pdfLoading = true;
      _pdfError = null;
    });

    try {
      final repo = ref.read(suggestionRepositoryProvider);
      final bytes = await repo.fileBytes(suggestionId);
      final tempFile = File('${Directory.systemTemp.path}/$suggestionId.pdf');
      await tempFile.writeAsBytes(bytes);
      if (!mounted) return;
      setState(() {
        _pdfFilePath = tempFile.path;
        _pdfLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _pdfError = e.toString();
        _pdfLoading = false;
      });
    }
  }

  Future<void> _confirmDelete(
    AppLocalizations l10n,
    DocumentSuggestion s,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.deleteSuggestion),
        content: Text(l10n.deleteSuggestionConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    await ref.read(suggestionControllerProvider.notifier).delete(s.id);
    if (!mounted) return;
    context.go('/suggestions');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (_error != null) {
      return ErrorState(message: _error!, onRetry: _load);
    }

    if (_suggestion == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final s = _suggestion!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (s.isPending) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: () =>
                            context.push('/suggestions/${s.id}/edit'),
                        icon: const Icon(Icons.edit_outlined, size: 16),
                        label: Text(l10n.editSuggestion),
                      ),
                      TextButton.icon(
                        onPressed: () => _confirmDelete(l10n, s),
                        icon: const Icon(Icons.delete_outline, size: 16),
                        label: Text(l10n.delete),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.error,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        s.displayTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: AppTokens.pageTitleSize,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _statusBadge(s),
                  ],
                ),
                if (s.authors != null && s.authors!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    s.authors!,
                    style: const TextStyle(
                      fontSize: AppTokens.bodySmallSize,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
                if (s.url != null && s.url!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () => openExternalUrl(s.url!),
                      child: Text(l10n.openLink),
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                Text(
                  _formatDate(s.createdAt),
                  style: const TextStyle(
                    fontSize: AppTokens.metaSize,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          if (s.userComment.isNotEmpty) ...[
            const SizedBox(height: 16),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.commentLabel,
                    style: const TextStyle(
                      fontSize: AppTokens.sectionTitleSize,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    s.userComment,
                    style: const TextStyle(
                      fontSize: AppTokens.bodySmallSize,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (s.adminComment != null && s.adminComment!.isNotEmpty) ...[
            const SizedBox(height: 16),
            AppCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.reviewComment,
                    style: const TextStyle(
                      fontSize: AppTokens.sectionTitleSize,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primary50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.primary200),
                    ),
                    child: Text(
                      s.adminComment!,
                      style: const TextStyle(
                        fontSize: AppTokens.bodySmallSize,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (s.originalFilename != null && s.fileType == 'pdf') ...[
            const SizedBox(height: 16),
            _buildPdfPreview(s.id),
          ],
          if (s.documentId != null) ...[
            const SizedBox(height: 16),
            AppCard(
              child: Row(
                children: [
                  const Icon(
                    Icons.description_outlined,
                    size: 20,
                    color: AppColors.success,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      l10n.resultingDocument,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: AppTokens.bodySmallSize,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.push('/documents/${s.documentId}'),
                    child: Text(
                      l10n.viewDocument,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _statusBadge(DocumentSuggestion s) {
    final color = s.isApproved
        ? AppColors.success
        : s.isRejected
        ? AppColors.error
        : AppColors.warning;

    final bg = s.isApproved
        ? const Color(0xFFdcfce7)
        : s.isRejected
        ? const Color(0xFFfecaca)
        : AppColors.primary100;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        s.status.name,
        style: TextStyle(
          fontSize: AppTokens.microSize,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
  }

  Widget _buildPdfPreview(String suggestionId) {
    final l10n = AppLocalizations.of(context)!;

    if (_pdfLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_pdfError != null) {
      return ErrorState(
        message: _pdfError!,
        onRetry: () => _loadPdf(suggestionId),
      );
    }

    if (_pdfFilePath == null) return const SizedBox.shrink();

    return AppCard(
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
          child: Stack(
            children: [
              PDFView(
                filePath: _pdfFilePath!,
                enableSwipe: true,
                swipeHorizontal: false,
                autoSpacing: false,
                pageFling: false,
                onError: (error) {
                  setState(() => _pdfError = error.toString());
                },
              ),
              Positioned(
                left: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    l10n.attachedPdf,
                    style: const TextStyle(
                      fontSize: AppTokens.microSize,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(String iso) {
    try {
      final dt = DateTime.parse(iso);
      return '${dt.day.toString().padLeft(2, '0')}/'
          '${dt.month.toString().padLeft(2, '0')}/'
          '${dt.year}';
    } catch (_) {
      return iso;
    }
  }
}
