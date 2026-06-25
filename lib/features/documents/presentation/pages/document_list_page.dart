import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../bootstrap/providers.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/ui/components.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/document_record.dart';

const _documentPageSize = 50;

class DocumentListPage extends ConsumerStatefulWidget {
  const DocumentListPage({super.key});

  @override
  ConsumerState<DocumentListPage> createState() => _DocumentListPageState();
}

class _DocumentListPageState extends ConsumerState<DocumentListPage> {
  final _searchController = TextEditingController();
  final List<DocumentRecord> _documents = [];
  Timer? _searchDebounce;
  String _searchQuery = '';
  String? _error;
  int _total = 0;
  bool _initialLoading = true;
  bool _loadingMore = false;

  bool get _hasMore => _documents.length < _total;

  @override
  void initState() {
    super.initState();
    _load(reset: true);
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _load({required bool reset}) async {
    if (_loadingMore) return;

    setState(() {
      if (reset) {
        _initialLoading = true;
        _error = null;
      } else {
        _loadingMore = true;
      }
    });

    try {
      final repo = ref.read(documentRepositoryProvider);
      final page = await repo.listPage(
        query: _searchQuery,
        limit: _documentPageSize,
        offset: reset ? 0 : _documents.length,
      );
      if (!mounted) return;
      setState(() {
        if (reset) {
          _documents
            ..clear()
            ..addAll(page.documents);
        } else {
          _documents.addAll(page.documents);
        }
        _total = page.total;
        _error = null;
        _initialLoading = false;
        _loadingMore = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _initialLoading = false;
        _loadingMore = false;
      });
    }
  }

  void _scheduleSearch(String value) {
    _searchQuery = value;
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 350), () {
      if (!mounted) return;
      _load(reset: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        PageIntro(
          title: l10n.kbTitle,
          subtitle: l10n.kbSubtitle,
          icon: Icons.menu_book_outlined,
        ),
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
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: HelpTooltip(message: l10n.searchDocumentsTooltip),
          ),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 36,
            minHeight: 36,
          ),
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
        onChanged: _scheduleSearch,
      ),
    );
  }

  Widget _buildContent(AppLocalizations l10n) {
    if (_error != null) {
      return ErrorState(message: _error!, onRetry: () => _load(reset: true));
    }

    if (_initialLoading) {
      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 4,
        itemBuilder: (_, _) => const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: LoadingSkeletonCard(),
        ),
      );
    }

    if (_documents.isEmpty) {
      return EmptyState(
        icon: Icons.menu_book_outlined,
        title: _searchQuery.trim().isEmpty
            ? l10n.kbEmpty
            : l10n.searchNoResults,
        subtitle: '',
      );
    }

    final indexed = _documents.where((d) => d.ingested).length;

    return RefreshIndicator(
      onRefresh: () => _load(reset: true),
      color: AppColors.primary,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _documents.length + 1 + (_hasMore ? 1 : 0),
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
                        l10n.documentPageSummary(
                          _documents.length,
                          _total,
                          indexed,
                        ),
                        style: const TextStyle(
                          fontSize: AppTokens.metaSize,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary700,
                        ),
                      ),
                    ),
                    HelpTooltip(message: l10n.kbIndexedTooltip),
                  ],
                ),
              ),
            );
          }

          if (index == _documents.length + 1) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: AppButton.secondary(
                label: l10n.loadMore,
                icon: Icons.expand_more,
                isLoading: _loadingMore,
                onPressed: _loadingMore ? null : () => _load(reset: false),
              ),
            );
          }

          final d = _documents[index - 1];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppCard(
              onTap: () => context.push('/documents/${d.id}'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    d.displayTitle,
                    style: const TextStyle(
                      fontSize: AppTokens.bodySmallSize,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      _infoBadge(d.displayType, AppColors.info),
                      _infoBadge(d.displaySize, AppColors.textSecondary),
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
