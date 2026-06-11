import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/ui/components.dart';
import '../../../l10n/app_localizations.dart';

class CookieConsentBanner extends StatefulWidget {
  const CookieConsentBanner({super.key});

  @override
  State<CookieConsentBanner> createState() => _CookieConsentBannerState();
}

class _CookieConsentBannerState extends State<CookieConsentBanner> {
  static const _storageKey = 'agroecology_consent_given';
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _loadPreference();
  }

  Future<void> _loadPreference() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(_storageKey);
    if (stored == null && mounted) {
      setState(() => _visible = true);
    }
  }

  Future<void> _accept() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_storageKey, 'accepted');
    if (mounted) setState(() => _visible = false);
  }

  Future<void> _decline() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_storageKey, 'declined');
    if (mounted) setState(() => _visible = false);
  }

  @override
  Widget build(BuildContext context) {
    if (!_visible) return const SizedBox.shrink();

    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: const Border(top: BorderSide(color: AppColors.primary100)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 2),
              child: Icon(Icons.privacy_tip_outlined,
                  size: 18, color: AppColors.primary),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                  children: [
                    TextSpan(text: l10n.consentMessage),
                    const TextSpan(text: ' '),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () => context.push('/privacy'),
                        child: Text(
                          l10n.drawerPrivacy,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    TextSpan(text: ' ${l10n.consentAnd} '),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () => context.push('/terms'),
                        child: Text(
                          l10n.drawerTerms,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              children: [
                SizedBox(
                  height: 32,
                  child: AppButton(
                    label: l10n.consentAccept,
                    onPressed: _accept,
                    icon: null,
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  height: 28,
                  child: TextButton(
                    onPressed: _decline,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 28),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      l10n.consentDecline,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
