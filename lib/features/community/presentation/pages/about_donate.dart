import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/ui/components.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'About',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(width: 8),
              const StatusBadge(label: 'BETA'),
            ],
          ),
          const SizedBox(height: 16),
          AppCard(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.lightbulb_outline,
                  size: 32,
                  color: AppColors.primary,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Agroecology Map AI is a free software tool that makes '
                  'agroecological knowledge easier to find, understand, and '
                  'share.',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textPrimary,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'The AI answers from the knowledge base documents, '
                  'keeping sources traceable rather than acting as a generic '
                  'chatbot.',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          AppCard(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.eco, size: 32, color: AppColors.primary),
                const SizedBox(height: 12),
                const Text(
                  'The project is part of the Agroecology Map ecosystem, '
                  'a citizen science, open data, and free software initiative '
                  'that maps agroecological experiences and connects '
                  'communities.',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textPrimary,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'The proposal is to support farmers, researchers, '
                  'extension workers, educators, students, communities, and '
                  'social movements.',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DonatePage extends StatelessWidget {
  const DonatePage({super.key});

  Future<void> _openKofi(BuildContext context) async {
    final uri = Uri.parse(AppConstants.kofiUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open the donation page.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.favorite, size: 24, color: AppColors.error),
              const SizedBox(width: 8),
              const Text(
                'Donate',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          AppCard(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Agroecology Map AI is maintained by volunteer work and free software.',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textPrimary,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Donations help maintain and expand infrastructure, processing, '
                  'storage, document indexing, and experiments with local models.',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Support strengthens an open platform, without paywalls, '
                  'dedicated to communities, researchers, and farmers.',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: AppButton.primary(
                    label: 'Donate via Ko-fi',
                    icon: Icons.favorite,
                    onPressed: () => _openKofi(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
