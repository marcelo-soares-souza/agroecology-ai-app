import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/ui/components.dart';
import '../../../../l10n/app_localizations.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageIntro(
            title: l10n.aboutPageTitle,
            subtitle: l10n.aboutPageSubtitle,
            icon: Icons.info_outline,
          ),
          const SizedBox(height: 4),
          AppCard(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', width: 72, height: 72),
                const SizedBox(height: 16),
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Text(
                      l10n.aboutPageTitle,
                      style: const TextStyle(
                        fontSize: AppTokens.pageTitleSize,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.aboutText1,
                  style: const TextStyle(
                    fontSize: AppTokens.bodySize,
                    color: AppColors.textPrimary,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          InfoCallout(
            icon: Icons.verified_outlined,
            title: l10n.aboutValueTitle,
            body: l10n.aboutValueBody,
          ),
          const SizedBox(height: 12),
          _AboutInfoBlock(
            icon: Icons.auto_awesome_outlined,
            text: l10n.aboutText2,
          ),
          const SizedBox(height: 12),
          _AboutInfoBlock(icon: Icons.public_outlined, text: l10n.aboutText3),
          const SizedBox(height: 12),
          _AboutInfoBlock(icon: Icons.groups_outlined, text: l10n.aboutText4),
        ],
      ),
    );
  }
}

class _AboutInfoBlock extends StatelessWidget {
  final IconData icon;
  final String text;

  const _AboutInfoBlock({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: AppColors.primary50,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 22, color: AppColors.primary),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: AppTokens.bodySize,
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
