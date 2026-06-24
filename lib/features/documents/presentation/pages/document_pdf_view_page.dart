import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import '../../../../bootstrap/providers.dart';
import '../../../../core/ui/components.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/document_record.dart';

class DocumentPdfViewPage extends ConsumerStatefulWidget {
  final String id;

  const DocumentPdfViewPage({super.key, required this.id});

  @override
  ConsumerState<DocumentPdfViewPage> createState() =>
      _DocumentPdfViewPageState();
}

class _DocumentPdfViewPageState extends ConsumerState<DocumentPdfViewPage> {
  DocumentRecord? _document;
  String? _pdfFilePath;
  bool _loading = true;
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
      if (!doc.fullFileAvailable || doc.fileType != 'pdf') {
        if (!mounted) return;
        setState(() {
          _document = doc;
          _error = AppLocalizations.of(context)!.documentAccessRestrictedBody;
          _loading = false;
        });
        return;
      }

      final bytes = await repo.downloadBytes(doc.id);
      final tempDir = Directory.systemTemp;
      final tempFile = File('${tempDir.path}/${doc.id}.pdf');
      await tempFile.writeAsBytes(bytes);

      if (!mounted) return;
      setState(() {
        _document = doc;
        _pdfFilePath = tempFile.path;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_document?.displayTitle ?? '')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return ErrorState(message: _error!, onRetry: _load);
    }

    if (_pdfFilePath == null) {
      return const SizedBox.shrink();
    }

    return PDFView(
      filePath: _pdfFilePath!,
      enableSwipe: true,
      swipeHorizontal: false,
      autoSpacing: false,
      pageFling: false,
      onError: (error) {
        setState(() => _error = error.toString());
      },
    );
  }
}
