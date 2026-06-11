import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../bootstrap/providers.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/ui/components.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/external_link.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/domain/entities/user.dart';

class CommunityListPage extends ConsumerStatefulWidget {
  const CommunityListPage({super.key});

  @override
  ConsumerState<CommunityListPage> createState() => _CommunityListPageState();
}

class _CommunityListPageState extends ConsumerState<CommunityListPage> {
  List<PublicUser>? _users;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final repo = ref.read(authRepositoryProvider);
      final users = await repo.listActiveUsers();
      setState(() {
        _users = users;
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

    if (_users == null) {
      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 4,
        itemBuilder: (_, _) => const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: LoadingSkeletonCard(),
        ),
      );
    }

    if (_users!.isEmpty) {
      return EmptyState(
        icon: Icons.people_outline,
        title: l10n.communityEmpty,
        subtitle: l10n.communityEmptySub,
      );
    }

    return RefreshIndicator(
      onRefresh: _load,
      color: AppColors.primary,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _users!.length,
        itemBuilder: (context, index) {
          final user = _users![index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppCard(
              onTap: () => context.push('/community/${user.slug}'),
              child: Row(
                children: [
                  AppAvatar(size: 48, imageUrl: user.avatarUrl),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.fullName,
                          style: const TextStyle(
                            fontSize: AppTokens.bodySmallSize,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '@${user.slug}',
                          style: const TextStyle(
                            fontSize: AppTokens.metaSize,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (user.approvedSuggestionsCount > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.lightbulb_outline,
                            size: 14,
                            color: AppColors.primary700,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${user.approvedSuggestionsCount}',
                            style: const TextStyle(
                              fontSize: AppTokens.microSize,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary700,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CommunityDetailPage extends ConsumerStatefulWidget {
  final String slug;

  const CommunityDetailPage({super.key, required this.slug});

  @override
  ConsumerState<CommunityDetailPage> createState() =>
      _CommunityDetailPageState();
}

class _CommunityDetailPageState extends ConsumerState<CommunityDetailPage> {
  User? _user;
  List<Map<String, dynamic>>? _suggestions;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final repo = ref.read(authRepositoryProvider);
      final user = await repo.getUserBySlug(widget.slug);
      setState(() {
        _user = user;
        _error = null;
      });

      try {
        final client = ref.read(apiClientProvider);
        final data = await client.get(
          '/api/v1/suggestions/public',
          queryParameters: {'user_id': user.id},
        );
        setState(() => _suggestions = List<Map<String, dynamic>>.from(data));
      } catch (_) {}
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

    if (_user == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final user = _user!;
    final isOwnProfile =
        ref.read(authControllerProvider).session?.userId == user.id;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCard(
            child: Column(
              children: [
                AppAvatar(size: 64, imageUrl: user.avatarUrl),
                const SizedBox(height: 12),
                Text(
                  user.fullName,
                  style: const TextStyle(
                    fontSize: AppTokens.pageTitleSize,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '@${user.slug}',
                  style: const TextStyle(
                    fontSize: AppTokens.metaSize,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StatusBadge.active(label: user.status),
                    const SizedBox(width: 8),
                    ...user.roles.map(
                      (r) => Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: r == 'admin'
                            ? StatusBadge.admin()
                            : StatusBadge.info(label: r),
                      ),
                    ),
                  ],
                ),
                if (isOwnProfile) ...[
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: AppButton.secondary(
                      label: l10n.editProfile,
                      icon: Icons.edit,
                      onPressed: () => context.push('/profile/edit'),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 16),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (user.link != null && user.link!.isNotEmpty) ...[
                  Row(
                    children: [
                      const Icon(
                        Icons.link,
                        size: 18,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        l10n.linkLabel,
                        style: const TextStyle(
                          fontSize: AppTokens.metaSize,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () => openExternalUrl(user.link!),
                        child: Text(l10n.openLink),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                ],
                _infoRow(
                  Icons.calendar_today,
                  l10n.joined,
                  _formatDate(user.createdAt),
                ),
                if (user.lastLoginAt != null) ...[
                  const Divider(height: 24),
                  _infoRow(
                    Icons.login,
                    l10n.lastLogin,
                    _formatDate(user.lastLoginAt!),
                  ),
                ],
              ],
            ),
          ),
          if (user.about != null && user.about!.isNotEmpty) ...[
            const SizedBox(height: 16),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.about,
                    style: const TextStyle(
                      fontSize: AppTokens.sectionTitleSize,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    user.about!,
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
          if (_suggestions != null && _suggestions!.isNotEmpty) ...[
            const SizedBox(height: 16),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.lightbulb_outline,
                        size: 18,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${l10n.approvedSuggestions} (${_suggestions!.length})',
                        style: const TextStyle(
                          fontSize: AppTokens.sectionTitleSize,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ..._suggestions!.map((s) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.primary50,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.primary200),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.description_outlined,
                              size: 18,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                s['title'] as String? ??
                                    s['filename'] as String? ??
                                    'Suggestion',
                                style: const TextStyle(
                                  fontSize: AppTokens.metaSize,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.textSecondary),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 13, color: AppColors.textPrimary),
            textAlign: TextAlign.right,
          ),
        ),
      ],
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
