import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../bootstrap/providers.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/ui/components.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/document_record.dart';

class DocumentDetailPage extends ConsumerStatefulWidget {
  final String id;

  const DocumentDetailPage({super.key, required this.id});

  @override
  ConsumerState<DocumentDetailPage> createState() => _DocumentDetailPageState();
}

class _DocumentDetailPageState extends ConsumerState<DocumentDetailPage> {
  DocumentRecord? _document;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final repo = ref.read(documentRepositoryProvider);
      final doc = await repo.getOne(widget.id);
      setState(() {
        _document = doc;
        _error = null;
      });
    } catch (e) {
      setState(() => _error = e.toString());
    }
  }

  Future<void> _download() async {
    if (_document == null) return;
    final repo = ref.read(documentRepositoryProvider);
    final url = repo.getDownloadUrl(_document!.id);
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (_error != null) {
      return ErrorState(message: _error!, onRetry: _load);
    }

    if (_document == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final d = _document!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  d.displayTitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (d.filename != d.displayTitle) ...[
                  const SizedBox(height: 4),
                  Text(
                    d.filename,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
                if (d.authors != null && d.authors!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    d.authors!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
                if (d.url != null && d.url!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => launchUrl(Uri.parse(d.url!)),
                    child: Text(
                      d.url!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.info,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    _infoChip(
                      Icons.insert_drive_file_outlined,
                      '${l10n.fileType}: ${d.displayType}',
                    ),
                    _infoChip(
                      Icons.storage_outlined,
                      '${l10n.fileSize}: ${d.displaySize}',
                    ),
                    _infoChip(
                      d.ingested ? Icons.check_circle : Icons.hourglass_empty,
                      d.ingested ? l10n.ingested : l10n.notIngested,
                    ),
                    _infoChip(Icons.folder_outlined, d.directory),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  _formatDate(d.createdAt),
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: AppButton.primary(
              label: l10n.download,
              icon: Icons.download,
              onPressed: _download,
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.textSecondary),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textSecondary,
            ),
          ),
        ],
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
