import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../bootstrap/providers.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/ui/components.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/document_record.dart';

class DocumentListPage extends ConsumerStatefulWidget {
  const DocumentListPage({super.key});

  @override
  ConsumerState<DocumentListPage> createState() => _DocumentListPageState();
}

class _DocumentListPageState extends ConsumerState<DocumentListPage> {
  List<DocumentRecord>? _documents;
  List<DocumentRecord> _filtered = [];
  String? _error;
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final repo = ref.read(documentRepositoryProvider);
      final docs = await repo.listAll();
      setState(() {
        _documents = docs;
        _error = null;
        _applyFilter();
      });
    } catch (e) {
      setState(() => _error = e.toString());
    }
  }

  void _applyFilter() {
    if (_documents == null) return;
    final q = _searchQuery.toLowerCase();
    setState(() {
      _filtered = _documents!
          .where(
            (d) =>
                d.displayTitle.toLowerCase().contains(q) ||
                (d.authors ?? '').toLowerCase().contains(q) ||
                d.filename.toLowerCase().contains(q),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        _buildSearchBar(l10n),
        Expanded(child: _buildContent(l10n)),
      ],
    );
  }

  Widget _buildSearchBar(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          bottom: BorderSide(color: AppColors.primary100, width: 1),
        ),
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: l10n.searchDocuments,
          prefixIcon: const Icon(Icons.search, size: 20),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary200),
          ),
        ),
        onChanged: (v) {
          _searchQuery = v;
          _applyFilter();
        },
      ),
    );
  }

  Widget _buildContent(AppLocalizations l10n) {
    if (_error != null) {
      return ErrorState(message: _error!, onRetry: _load);
    }

    if (_documents == null) {
      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 4,
        itemBuilder: (_, _) => const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: LoadingSkeletonCard(),
        ),
      );
    }

    final docs = _documents;
    if (docs == null) return const SizedBox.shrink();

    if (_filtered.isEmpty) {
      return EmptyState(
        icon: Icons.menu_book_outlined,
        title: l10n.kbEmpty,
        subtitle: l10n.noSuggestionsSub,
      );
    }

    final indexed = docs.where((d) => d.ingested).length;
    final total = docs.length;

    return RefreshIndicator(
      onRefresh: _load,
      color: AppColors.primary,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _filtered.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.cloud_done_outlined,
                      size: 18,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        indexed == total
                            ? l10n.allIndexed
                            : l10n.indexedCount(indexed, total),
                        style: const TextStyle(
                          fontSize: AppTokens.metaSize,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 80,
                      child: LinearProgressIndicator(
                        value: total > 0 ? indexed / total : 0,
                        backgroundColor: AppColors.primary100,
                        color: AppColors.primary,
                        minHeight: 4,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          final d = _filtered[index - 1];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppCard(
              onTap: () => context.push('/documents/${d.id}'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          d.displayTitle,
                          style: const TextStyle(
                            fontSize: AppTokens.bodySmallSize,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  if (d.authors != null && d.authors!.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      d.authors!,
                      style: const TextStyle(
                        fontSize: AppTokens.metaSize,
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _infoBadge(d.displayType, AppColors.info),
                      const SizedBox(width: 6),
                      _infoBadge(d.displaySize, AppColors.textSecondary),
                      const SizedBox(width: 6),
                      _infoBadge(
                        d.ingested ? l10n.ingested : l10n.notIngested,
                        d.ingested ? AppColors.success : AppColors.warning,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _infoBadge(String label, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.primary50,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: AppTokens.microSize,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
