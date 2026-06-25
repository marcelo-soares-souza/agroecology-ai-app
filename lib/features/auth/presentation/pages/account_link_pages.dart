import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../bootstrap/providers.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/ui/components.dart';
import '../../../../l10n/app_localizations.dart';

class ConfirmEmailPage extends ConsumerStatefulWidget {
  final String? token;

  const ConfirmEmailPage({super.key, this.token});

  @override
  ConsumerState<ConfirmEmailPage> createState() => _ConfirmEmailPageState();
}

class _ConfirmEmailPageState extends ConsumerState<ConfirmEmailPage> {
  bool _loading = true;
  bool _success = false;
  String? _message;

  @override
  void initState() {
    super.initState();
    Future.microtask(_confirm);
  }

  Future<void> _confirm() async {
    final token = widget.token?.trim();
    if (token == null || token.isEmpty) {
      setState(() {
        _loading = false;
        _success = false;
        _message = AppLocalizations.of(context)!.missingToken;
      });
      return;
    }

    try {
      final message = await ref
          .read(authControllerProvider.notifier)
          .confirmEmail(token);
      if (!mounted) return;
      setState(() {
        _loading = false;
        _success = true;
        _message = message;
      });
    } on AppException catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _success = false;
        _message = e.message;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _success = false;
        _message = AppLocalizations.of(context)!.emailConfirmationFailed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _AccountResultScaffold(
      loading: _loading,
      success: _success,
      title: _success ? l10n.emailConfirmedTitle : l10n.emailConfirmationTitle,
      message: _message ?? l10n.confirmingEmail,
      actionLabel: l10n.goToSignIn,
      onAction: () => context.go('/login'),
    );
  }
}

class ResendConfirmationPage extends ConsumerStatefulWidget {
  const ResendConfirmationPage({super.key});

  @override
  ConsumerState<ResendConfirmationPage> createState() =>
      _ResendConfirmationPageState();
}

class _ResendConfirmationPageState
    extends ConsumerState<ResendConfirmationPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _loading = false;
  bool _sent = false;
  String? _error;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      await ref
          .read(authControllerProvider.notifier)
          .resendConfirmation(_emailController.text.trim());
      if (!mounted) return;
      setState(() {
        _loading = false;
        _sent = true;
      });
    } on AppException catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = e.message;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = AppLocalizations.of(context)!.resendConfirmationFailed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (_sent) {
      return _AccountResultScaffold(
        loading: false,
        success: true,
        title: l10n.resendConfirmationSentTitle,
        message: l10n.resendConfirmationSentBody,
        actionLabel: l10n.goToSignIn,
        onAction: () => context.go('/login'),
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PageIntro(
                title: l10n.resendConfirmationTitle,
                subtitle: l10n.resendConfirmationInstruction,
                icon: Icons.mark_email_unread_outlined,
              ),
              if (_error != null) ...[
                const SizedBox(height: 16),
                _InlineMessage(message: _error!, success: false),
              ],
              const SizedBox(height: 24),
              TextFormField(
                controller: _emailController,
                autofillHints: const [AutofillHints.email],
                decoration: InputDecoration(
                  labelText: l10n.emailLabel,
                  hintText: l10n.emailHint,
                  helperText: l10n.emailHelper,
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => _submit(),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.emailRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              AppButton.primary(
                label: l10n.resendConfirmationButton,
                isLoading: _loading,
                onPressed: _loading ? null : _submit,
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => context.go('/login'),
                child: Text(l10n.backToSignIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConfirmDeleteAccountPage extends ConsumerStatefulWidget {
  final String? token;

  const ConfirmDeleteAccountPage({super.key, this.token});

  @override
  ConsumerState<ConfirmDeleteAccountPage> createState() =>
      _ConfirmDeleteAccountPageState();
}

class _ConfirmDeleteAccountPageState
    extends ConsumerState<ConfirmDeleteAccountPage> {
  bool _loading = true;
  bool _success = false;
  String? _message;

  @override
  void initState() {
    super.initState();
    Future.microtask(_confirm);
  }

  Future<void> _confirm() async {
    final token = widget.token?.trim();
    if (token == null || token.isEmpty) {
      setState(() {
        _loading = false;
        _success = false;
        _message = AppLocalizations.of(context)!.missingToken;
      });
      return;
    }

    try {
      final message = await ref
          .read(authControllerProvider.notifier)
          .confirmDeleteAccount(token);
      if (!mounted) return;
      setState(() {
        _loading = false;
        _success = true;
        _message = message;
      });
    } on AppException catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _success = false;
        _message = e.message;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _success = false;
        _message = AppLocalizations.of(context)!.deleteAccountFailed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _AccountResultScaffold(
      loading: _loading,
      success: _success,
      title: _success
          ? l10n.accountDeletedTitle
          : l10n.deleteAccountConfirmTitle,
      message: _message ?? l10n.deleteAccountConfirming,
      actionLabel: l10n.goToSignIn,
      onAction: () async {
        await ref
            .read(authControllerProvider.notifier)
            .logout(revokeRemote: false);
        if (!context.mounted) return;
        context.go('/login');
      },
    );
  }
}

class _AccountResultScaffold extends StatelessWidget {
  final bool loading;
  final bool success;
  final String title;
  final String message;
  final String actionLabel;
  final VoidCallback onAction;

  const _AccountResultScaffold({
    required this.loading,
    required this.success,
    required this.title,
    required this.message,
    required this.actionLabel,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: AppCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  loading
                      ? Icons.hourglass_empty
                      : success
                      ? Icons.check_circle_outline
                      : Icons.error_outline,
                  color: loading
                      ? AppColors.primary
                      : success
                      ? AppColors.success
                      : AppColors.error,
                  size: 48,
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: AppTokens.pageTitleSize,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                if (loading)
                  const Center(child: CircularProgressIndicator())
                else
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: AppTokens.bodySmallSize,
                      color: AppColors.textSecondary,
                      height: 1.45,
                    ),
                  ),
                const SizedBox(height: 24),
                if (!loading)
                  AppButton.primary(label: actionLabel, onPressed: onAction),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InlineMessage extends StatelessWidget {
  final String message;
  final bool success;

  const _InlineMessage({required this.message, required this.success});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: success ? const Color(0xFFdcfce7) : const Color(0xFFfecaca),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            success ? Icons.check_circle_outline : Icons.error_outline,
            color: success ? AppColors.success : AppColors.error,
            size: 18,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontSize: AppTokens.metaSize,
                color: success
                    ? const Color(0xFF166534)
                    : const Color(0xFF991b1b),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
