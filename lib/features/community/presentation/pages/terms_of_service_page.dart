import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/ui/components.dart';
import '../../../../l10n/app_localizations.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.gavel_outlined,
                  size: 24, color: AppColors.primary),
              const SizedBox(width: 8),
              Text(
                l10n.termsOfServiceTitle,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            l10n.termsOfServiceLastUpdated,
            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 16),
          AppCard(
            padding: const EdgeInsets.all(20),
            child: Text(
              l10n.termsOfServiceContent,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textPrimary,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
