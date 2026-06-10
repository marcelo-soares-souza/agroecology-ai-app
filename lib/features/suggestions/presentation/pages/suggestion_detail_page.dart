import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../bootstrap/providers.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/ui/components.dart';
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
    } catch (e) {
      setState(() => _error = e.toString());
    }
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
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        s.displayTitle,
                        style: const TextStyle(
                          fontSize: 18,
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
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
                if (s.url != null && s.url!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    s.url!,
                    style: const TextStyle(fontSize: 13, color: AppColors.info),
                  ),
                ],
                if (s.originalFilename != null) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.insert_drive_file_outlined,
                        size: 16,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${l10n.filename}: ${s.originalFilename}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 8),
                Text(
                  _formatDate(s.createdAt),
                  style: const TextStyle(
                    fontSize: 12,
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
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    s.userComment,
                    style: const TextStyle(
                      fontSize: 14,
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
                    l10n.adminComment,
                    style: const TextStyle(
                      fontSize: 14,
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
                        fontSize: 14,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  TextButton(onPressed: () {}, child: Text(l10n.viewDocument)),
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
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: color,
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
