import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../bootstrap/providers.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/ui/components.dart';
import '../../../../core/utils/external_link.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  List<Map<String, dynamic>>? _suggestions;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final auth = ref.read(authControllerProvider);
      if (auth.isAuthenticated) {
        ref.read(authControllerProvider.notifier).fetchProfile();
        _loadSuggestions();
      }
    });
  }

  Future<void> _loadSuggestions() async {
    try {
      final auth = ref.read(authControllerProvider);
      final userId = auth.session?.userId;
      if (userId == null) return;
      final client = ref.read(apiClientProvider);
      final data = await client.get(
        '/api/v1/suggestions/public',
        queryParameters: {'user_id': userId},
      );
      setState(() => _suggestions = List<Map<String, dynamic>>.from(data));
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final auth = ref.watch(authControllerProvider);

    if (!auth.isAuthenticated) {
      return EmptyState(
        icon: Icons.person_off,
        title: l10n.profileNotAuth,
        subtitle: l10n.profileNotAuthSub,
      );
    }

    return _buildProfileContent(l10n, auth);
  }

  Widget _buildProfileContent(AppLocalizations l10n, AuthState auth) {
    final profile = auth.profile;

    String resolveStatusLabel(String status, AppLocalizations l10n) {
      return switch (status) {
        'active' => l10n.statusActive,
        'pending' => l10n.statusPending,
        'suspended' => l10n.statusSuspended,
        'deleted' => l10n.statusDeleted,
        _ => status,
      };
    }

    Future<void> handleExport() async {
      try {
        await ref.read(authControllerProvider.notifier).exportMyData();
        if (!context.mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.exportSuccess)));
      } catch (e) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.exportFailed)));
      }
    }

    Future<void> handleDeleteRequest() async {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(l10n.deleteAccountConfirmTitle),
          content: Text(l10n.deleteAccountConfirmBody),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(l10n.cancel),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(
                l10n.deleteAccountConfirmButton,
                style: const TextStyle(color: AppColors.error),
              ),
            ),
          ],
        ),
      );

      if (confirmed == true && context.mounted) {
        try {
          final message = await ref
              .read(authControllerProvider.notifier)
              .requestDeleteAccount();
          if (!context.mounted) return;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message)));
        } catch (e) {
          if (!context.mounted) return;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.deleteAccountFailed)));
        }
      }
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCard(
            child: Column(
              children: [
                AppAvatar(size: 72, imageUrl: profile?.avatarUrl),
                const SizedBox(height: 12),
                Text(
                  profile?.fullName ?? auth.session?.fullName ?? '',
                  style: const TextStyle(
                    fontSize: AppTokens.pageTitleSize,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (profile != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    '@${profile.slug}',
                    style: const TextStyle(
                      fontSize: AppTokens.metaSize,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StatusBadge.active(
                      label: resolveStatusLabel(
                        profile?.status ?? 'active',
                        l10n,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ...profile?.roles
                            .map(
                              (r) => Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: r == 'admin'
                                    ? StatusBadge.admin(label: l10n.roleAdmin)
                                    : StatusBadge.info(
                                        label: r == 'user' ? l10n.roleUser : r,
                                      ),
                              ),
                            )
                            .toList() ??
                        [],
                  ],
                ),
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
            ),
          ),
          if (profile != null) ...[
            const SizedBox(height: 16),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (profile.link != null && profile.link!.isNotEmpty) ...[
                    _linkActionRow(
                      context,
                      l10n.linkLabel,
                      l10n.openLink,
                      profile.link!,
                    ),
                    const Divider(height: 24),
                  ],
                  _infoRow(
                    Icons.calendar_today,
                    l10n.joined,
                    _formatDate(
                      profile.createdAt,
                      Localizations.localeOf(context).languageCode,
                    ),
                  ),
                  if (profile.lastLoginAt != null) ...[
                    const Divider(height: 24),
                    _infoRow(
                      Icons.login,
                      l10n.lastLogin,
                      _formatDate(
                        profile.lastLoginAt!,
                        Localizations.localeOf(context).languageCode,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (profile.about != null && profile.about!.isNotEmpty) ...[
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
                      profile.about!,
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
                                  overflow: TextOverflow.ellipsis,
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
            const SizedBox(height: 16),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    l10n.dataAndPrivacy,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  AppButton(
                    label: l10n.exportMyData,
                    icon: Icons.download_outlined,
                    width: double.infinity,
                    isOutlined: true,
                    onPressed: handleExport,
                  ),
                  const SizedBox(height: 8),
                  AppButton(
                    label: l10n.deleteMyAccount,
                    icon: Icons.delete_outline,
                    width: double.infinity,
                    backgroundColor: const Color(0xFFfecaca),
                    foregroundColor: AppColors.error,
                    onPressed: handleDeleteRequest,
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _openLink(String rawUrl) async {
    await openExternalUrl(rawUrl);
  }

  Widget _linkActionRow(
    BuildContext context,
    String label,
    String actionLabel,
    String value,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.link, size: 18, color: AppColors.textSecondary),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: AppTokens.metaSize,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => _openLink(value),
              child: Text(actionLabel),
            ),
          ),
        ),
      ],
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
            fontSize: AppTokens.metaSize,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: AppTokens.metaSize,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  String _formatDate(String iso, String localeStr) {
    try {
      final dt = DateTime.parse(iso);
      if (localeStr.startsWith('en')) {
        return '${dt.month.toString().padLeft(2, '0')}/'
            '${dt.day.toString().padLeft(2, '0')}/'
            '${dt.year}';
      }
      return '${dt.day.toString().padLeft(2, '0')}/'
          '${dt.month.toString().padLeft(2, '0')}/'
          '${dt.year}';
    } catch (_) {
      return iso;
    }
  }
}

class ProfileEditPage extends ConsumerStatefulWidget {
  const ProfileEditPage({super.key});

  @override
  ConsumerState<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends ConsumerState<ProfileEditPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _aboutController;
  late final TextEditingController _linkController;
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    final profile = ref.read(authControllerProvider).profile;

    _nameController = TextEditingController(text: profile?.fullName ?? '');
    _aboutController = TextEditingController(text: profile?.about ?? '');
    _linkController = TextEditingController(text: profile?.link ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _aboutController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  Future<void> _pickAndUploadAvatar() async {
    final l10n = AppLocalizations.of(context)!;
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxWidth: 256,
      maxHeight: 256,
    );

    if (picked == null) return;

    final file = File(picked.path);
    final sizeInBytes = await file.length();

    if (sizeInBytes > AppConstants.avatarMaxSizeBytes) {
      setState(() => _error = l10n.imageTooLarge(AppConstants.avatarMaxSizeMB));
      return;
    }

    setState(() => _saving = true);

    try {
      await ref.read(authControllerProvider.notifier).uploadAvatar(picked.path);
      setState(() => _error = null);
    } on AppException catch (e) {
      setState(() => _error = e.message);
    } catch (_) {
      setState(() => _error = l10n.uploadAvatarFailed);
    } finally {
      setState(() => _saving = false);
    }
  }

  Future<void> _save() async {
    final l10n = AppLocalizations.of(context)!;
    if (!_formKey.currentState!.validate()) return;

    setState(() => _saving = true);

    try {
      await ref
          .read(authControllerProvider.notifier)
          .updateProfile(
            fullName: _nameController.text.trim(),
            about: _aboutController.text.trim().isEmpty
                ? _aboutController.text.trim()
                : _aboutController.text.trim(),
            link: _linkController.text.trim().isEmpty
                ? null
                : _linkController.text.trim(),
          );
      setState(() => _error = null);
      if (mounted) context.pop();
    } on AppException catch (e) {
      setState(() => _error = e.message);
    } catch (_) {
      setState(() => _error = l10n.saveProfileFailed);
    } finally {
      setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final profile = ref.watch(authControllerProvider).profile;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
        title: Text(l10n.editProfile),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    AppAvatar(size: 80, imageUrl: profile?.avatarUrl),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickAndUploadAvatar,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (_error != null) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFfecaca),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 18,
                        color: AppColors.error,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _error!,
                          style: const TextStyle(
                            fontSize: AppTokens.metaSize,
                            color: Color(0xFF991b1b),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 24),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: l10n.fullNameLabel,
                  prefixIcon: const Icon(Icons.person_outline),
                ),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return l10n.nameRequired;
                  }
                  if (v.length > 200) {
                    return l10n.fullNameMaxLength;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _aboutController,
                decoration: InputDecoration(
                  labelText: l10n.about,
                  hintText: l10n.aboutHint,
                  prefixIcon: const Icon(Icons.info_outline),
                  counterText: '${_aboutController.text.length}/4096',
                ),
                maxLines: 5,
                maxLength: AppConstants.aboutMaxLength,
                validator: (v) {
                  if (v != null && v.length > AppConstants.aboutMaxLength) {
                    return l10n.aboutMaxLength(AppConstants.aboutMaxLength);
                  }
                  return null;
                },
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _linkController,
                decoration: InputDecoration(
                  labelText: l10n.linkLabel,
                  hintText: l10n.linkHint,
                  prefixIcon: const Icon(Icons.link),
                ),
                keyboardType: TextInputType.url,
                validator: (v) {
                  if (v != null && v.trim().isNotEmpty) {
                    if (!v.startsWith('http://') && !v.startsWith('https://')) {
                      return l10n.linkValidation;
                    }
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: AppButton.primary(
                  label: l10n.save,
                  onPressed: _saving ? null : _save,
                  isLoading: _saving,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
