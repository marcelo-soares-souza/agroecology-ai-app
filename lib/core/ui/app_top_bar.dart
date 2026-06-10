import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'components.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuTap;
  final Widget? title;
  final List<Widget>? actions;

  const AppTopBar({super.key, this.onMenuTap, this.title, this.actions});

  @override
  Widget build(BuildContext context) {
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
              const Text(
                'Agroecology Map AI',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 8),
              const StatusBadge(label: 'BETA'),
            ],
          ),
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
