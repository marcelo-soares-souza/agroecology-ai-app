import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../bootstrap/providers.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/ui/components.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/document_suggestion.dart';
import '../controllers/suggestion_controller.dart';

class SuggestionListPage extends ConsumerStatefulWidget {
  const SuggestionListPage({super.key});

  @override
  ConsumerState<SuggestionListPage> createState() => _SuggestionListPageState();
}

class _SuggestionListPageState extends ConsumerState<SuggestionListPage> {
  String? _statusFilter;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(suggestionControllerProvider.notifier).load();
    });
  }

  void _filter(String? status) {
    setState(() => _statusFilter = status);
    ref.read(suggestionControllerProvider.notifier).load(status: status);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(suggestionControllerProvider);

    return Column(
      children: [
        _buildHeader(context, l10n, state),
        _buildFilterBar(l10n),
        Expanded(child: _buildContent(l10n, state)),
      ],
    );
  }

  Widget _buildHeader(
    BuildContext context,
    AppLocalizations l10n,
    SuggestionListState state,
  ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          bottom: BorderSide(color: AppColors.primary100, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.mySuggestions,
            style: const TextStyle(
              fontSize: AppTokens.pageTitleSize,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            l10n.suggestionsSubtitle,
            style: const TextStyle(
              fontSize: AppTokens.bodySmallSize,
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${state.suggestions.length} ${l10n.suggestionCountLabel}',
            style: const TextStyle(
              fontSize: AppTokens.metaSize,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () => context.push('/suggestions/new'),
            icon: const Icon(Icons.add, size: 18),
            label: Text(l10n.suggestDocument),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBar(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          bottom: BorderSide(color: AppColors.primary100, width: 1),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _FilterChip(
              label: l10n.allStatus,
              selected: _statusFilter == null,
              onTap: () => _filter(null),
            ),
            _FilterChip(
              label: l10n.statusPending,
              selected: _statusFilter == 'pending',
              onTap: () => _filter('pending'),
            ),
            _FilterChip(
              label: l10n.statusApproved,
              selected: _statusFilter == 'approved',
              onTap: () => _filter('approved'),
            ),
            _FilterChip(
              label: l10n.statusRejected,
              selected: _statusFilter == 'rejected',
              onTap: () => _filter('rejected'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(AppLocalizations l10n, SuggestionListState state) {
    if (state.isLoading && state.suggestions.isEmpty) {
      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3,
        itemBuilder: (_, _) => const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: LoadingSkeletonCard(),
        ),
      );
    }

    if (state.error != null && state.suggestions.isEmpty) {
      return ErrorState(
        message: state.error!,
        onRetry: () => ref
            .read(suggestionControllerProvider.notifier)
            .load(status: _statusFilter),
      );
    }

    if (state.suggestions.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.lightbulb_outline,
                size: 48,
                color: AppColors.primary200,
              ),
              const SizedBox(height: 16),
              Text(
                l10n.noSuggestions,
                style: const TextStyle(
                  fontSize: AppTokens.sectionTitleSize,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                l10n.noSuggestionsSub,
                style: const TextStyle(
                  fontSize: AppTokens.bodySmallSize,
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              AppButton.primary(
                label: l10n.suggestDocument,
                icon: Icons.add,
                onPressed: () => context.push('/suggestions/new'),
              ),
            ],
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => ref
          .read(suggestionControllerProvider.notifier)
          .load(status: _statusFilter),
      color: AppColors.primary,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: state.suggestions.length,
        itemBuilder: (context, index) {
          final s = state.suggestions[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppCard(
              onTap: () => context.push('/suggestions/${s.id}'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          s.displayTitle,
                          style: const TextStyle(
                            fontSize: AppTokens.bodySmallSize,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      _buildStatusBadge(s, l10n),
                    ],
                  ),
                  if (s.originalFilename != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.insert_drive_file_outlined,
                          size: 14,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            s.originalFilename!,
                            style: const TextStyle(
                              fontSize: AppTokens.metaSize,
                              color: AppColors.textSecondary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 6),
                  Text(
                    _formatDate(s.createdAt),
                    style: const TextStyle(
                      fontSize: AppTokens.microSize,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  if (s.isPending) ...[
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          onPressed: () => _confirmDelete(context, l10n, s),
                          icon: const Icon(Icons.delete_outline, size: 16),
                          label: Text(
                            l10n.delete,
                            style: const TextStyle(
                              fontSize: AppTokens.metaSize,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.error,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatusBadge(DocumentSuggestion s, AppLocalizations l10n) {
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

    final label = s.isApproved
        ? l10n.statusApproved
        : s.isRejected
        ? l10n.statusRejected
        : l10n.statusPending;

    return Tooltip(
      message: l10n.suggestionStatusTooltip,
      triggerMode: TooltipTriggerMode.tap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: AppTokens.microSize,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
      ),
    );
  }

  void _confirmDelete(
    BuildContext context,
    AppLocalizations l10n,
    DocumentSuggestion s,
  ) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.deleteSuggestion),
        content: Text(l10n.deleteSuggestionConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              ref.read(suggestionControllerProvider.notifier).delete(s.id);
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: Text(l10n.delete),
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

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : AppColors.primary50,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: selected ? Colors.white : AppColors.primary700,
            ),
          ),
        ),
      ),
    );
  }
}
