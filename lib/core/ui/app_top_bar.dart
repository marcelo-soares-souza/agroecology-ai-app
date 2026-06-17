import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../theme/app_theme.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuTap;
  final Widget? title;
  final List<Widget>? actions;

  const AppTopBar({super.key, this.onMenuTap, this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AppBar(
      leading: onMenuTap != null
          ? IconButton(icon: const Icon(Icons.menu), onPressed: onMenuTap)
          : null,
      title:
          title ??
          Row(
            children: [
              Image.asset('assets/logo.png', width: 28, height: 28),
              const SizedBox(width: 8),
              Text(
                l10n.appName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
