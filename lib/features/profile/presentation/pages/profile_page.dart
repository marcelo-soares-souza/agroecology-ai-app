import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../../bootstrap/providers.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/ui/components.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);
    final isAuthenticated = auth.isAuthenticated;

    if (!isAuthenticated) {
      return const EmptyState(
        icon: Icons.person_off,
        title: 'Not authenticated',
        subtitle: 'Sign in to view your profile.',
      );
    }

    return _buildProfileContent(context, ref, auth);
  }

  Widget _buildProfileContent(
    BuildContext context,
    WidgetRef ref,
    AuthState auth,
  ) {
    final profile = auth.profile;

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
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (profile != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    '@${profile.slug}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StatusBadge.active(label: profile?.status ?? 'active'),
                    const SizedBox(width: 8),
                    ...profile?.roles.map(
                          (r) => Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: r == 'admin'
                                ? StatusBadge.admin()
                                : StatusBadge.info(label: r),
                          ),
                        ) ??
                        [],
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: AppButton.secondary(
                    label: 'Edit Profile',
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
                  _infoRow(Icons.email_outlined, 'Email', profile.email),
                  if (profile.link != null && profile.link!.isNotEmpty) ...[
                    const Divider(height: 24),
                    _infoRow(Icons.link, 'Link', profile.link!),
                  ],
                  const Divider(height: 24),
                  _infoRow(
                    Icons.calendar_today,
                    'Joined',
                    _formatDate(profile.createdAt),
                  ),
                  if (profile.lastLoginAt != null) ...[
                    const Divider(height: 24),
                    _infoRow(
                      Icons.login,
                      'Last login',
                      _formatDate(profile.lastLoginAt!),
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
                    const Text(
                      'About',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      profile.about!,
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
      setState(
        () => _error =
            'Image must be less than ${AppConstants.avatarMaxSizeMB} MB',
      );
      return;
    }

    setState(() => _saving = true);

    try {
      await ref.read(authControllerProvider.notifier).uploadAvatar(picked.path);
      setState(() => _error = null);
    } on AppException catch (e) {
      setState(() => _error = e.message);
    } catch (_) {
      setState(() => _error = 'Failed to upload avatar.');
    } finally {
      setState(() => _saving = false);
    }
  }

  Future<void> _save() async {
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
      setState(() => _error = 'Failed to save profile.');
    } finally {
      setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(authControllerProvider).profile;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
        title: const Text('Edit Profile'),
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
                            fontSize: 13,
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
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Name is required';
                  }
                  if (v.length > 200) {
                    return 'Name must be less than 200 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _aboutController,
                decoration: InputDecoration(
                  labelText: 'About',
                  hintText: 'Tell the community about yourself',
                  prefixIcon: const Icon(Icons.info_outline),
                  counterText: '${_aboutController.text.length}/4096',
                ),
                maxLines: 5,
                maxLength: AppConstants.aboutMaxLength,
                validator: (v) {
                  if (v != null && v.length > AppConstants.aboutMaxLength) {
                    return 'About must be less than ${AppConstants.aboutMaxLength} characters';
                  }
                  return null;
                },
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _linkController,
                decoration: const InputDecoration(
                  labelText: 'Link',
                  hintText: 'https://example.com',
                  prefixIcon: Icon(Icons.link),
                ),
                keyboardType: TextInputType.url,
                validator: (v) {
                  if (v != null && v.trim().isNotEmpty) {
                    if (!v.startsWith('http://') && !v.startsWith('https://')) {
                      return 'Link must start with http:// or https://';
                    }
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: AppButton.primary(
                  label: 'Save',
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
