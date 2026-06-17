import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:file_picker/file_picker.dart';
import 'package:go_router/go_router.dart';

import '../../../../bootstrap/providers.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/ui/components.dart';
import '../../../../core/utils/external_link.dart';
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
  bool _downloading = false;

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
      final repo = ref.read(documentRepositoryProvider);
      final doc = await repo.getOne(widget.id);
      setState(() {
        _document = doc;
        _error = null;
      });
      if (doc.fileType == 'pdf') {
        _loadPdf();
      }
    } catch (e) {
      setState(() => _error = e.toString());
    }
  }

  Future<void> _loadPdf() async {
    if (_document == null) return;

    setState(() {
      _pdfLoading = true;
      _pdfError = null;
    });

    try {
      final repo = ref.read(documentRepositoryProvider);
      final bytes = await repo.downloadBytes(_document!.id);
      final tempDir = Directory.systemTemp;
      final tempFile = File('${tempDir.path}/${_document!.id}.pdf');
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

  Future<void> _download() async {
    if (_document == null) return;
    final doc = _document!;
    final l10n = AppLocalizations.of(context)!;

    setState(() => _downloading = true);

    try {
      final repo = ref.read(documentRepositoryProvider);
      final bytes = await repo.downloadBytes(doc.id);

      await FilePicker.platform.saveFile(
        fileName: doc.filename,
        bytes: bytes,
        type: FileType.custom,
        allowedExtensions: [doc.fileType],
      );

      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.downloadSuccess)));
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.downloadError)));
      }
    } finally {
      if (mounted) setState(() => _downloading = false);
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
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: AppTokens.pageTitleSize,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (d.filename != d.displayTitle) ...[
                  const SizedBox(height: 4),
                  Text(
                    d.filename,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: AppTokens.metaSize,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
                if (d.authors != null && d.authors!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    d.authors!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: AppTokens.bodySmallSize,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
                if (d.url != null && d.url!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () => openExternalUrl(d.url!),
                      child: Text(l10n.openLink),
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
                InfoCallout(
                  icon: Icons.search_outlined,
                  title: d.ingested
                      ? l10n.documentIndexedTitle
                      : l10n.documentNotIndexedTitle,
                  body: d.ingested
                      ? l10n.documentIndexedBody
                      : l10n.documentNotIndexedBody,
                ),
                const SizedBox(height: 12),
                Text(
                  _formatDate(d.createdAt),
                  style: const TextStyle(
                    fontSize: AppTokens.metaSize,
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
              onPressed: _downloading ? null : _download,
              isLoading: _downloading,
            ),
          ),
          if (d.fileType == 'pdf') ...[
            const SizedBox(height: 16),
            _buildPdfPreview(),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: AppButton.primary(
                label: l10n.viewDocument,
                icon: Icons.open_in_full,
                onPressed: _pdfFilePath != null
                    ? () => context.push('/documents/${d.id}/view')
                    : null,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPdfPreview() {
    if (_pdfLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_pdfError != null) {
      return ErrorState(message: _pdfError!, onRetry: _loadPdf);
    }

    if (_pdfFilePath == null) {
      return const SizedBox.shrink();
    }

    return AppCard(
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppTokens.cardRadius),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: PDFView(
            filePath: _pdfFilePath!,
            enableSwipe: false,
            swipeHorizontal: false,
            autoSpacing: false,
            pageFling: false,
            onError: (error) {
              setState(() => _pdfError = error.toString());
            },
          ),
        ),
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
              fontSize: AppTokens.microSize,
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
