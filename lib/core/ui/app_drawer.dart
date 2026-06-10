import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_theme.dart';

class AppDrawer extends StatelessWidget {
  final bool isAuthenticated;
  final String locale;
  final List<String> supportedLocales;
  final ValueChanged<String>? onLocaleChanged;
  final VoidCallback? onLogout;

  const AppDrawer({
    super.key,
    required this.isAuthenticated,
    required this.locale,
    this.supportedLocales = const ['pt', 'en', 'es', 'fr'],
    this.onLocaleChanged,
    this.onLogout,
  });

  String _localeLabel(String loc) {
    return switch (loc) {
      'pt' => 'Português',
      'en' => 'English',
      'es' => 'Español',
      'fr' => 'Français',
      _ => loc,
    };
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();

    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(context),
            const Divider(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _NavItem(
                    icon: Icons.chat_bubble_outline,
                    label: 'Chat',
                    selected: currentRoute.startsWith('/chat'),
                    onTap: () => _navigate(context, '/chat'),
                  ),
                  _NavItem(
                    icon: Icons.people_outline,
                    label: 'Community',
                    selected: currentRoute.startsWith('/community'),
                    onTap: () => _navigate(context, '/community'),
                  ),
                  _NavItem(
                    icon: Icons.person_outline,
                    label: 'Profile',
                    selected: currentRoute.startsWith('/profile'),
                    onTap: () => _navigate(context, '/profile'),
                  ),
                  _NavItem(
                    icon: Icons.info_outline,
                    label: 'About',
                    selected: currentRoute == '/about',
                    onTap: () => _navigate(context, '/about'),
                  ),
                  _NavItem(
                    icon: Icons.favorite_border,
                    label: 'Donate',
                    selected: false,
                    onTap: () {
                      context.push('/donate');
                    },
                  ),
                  const Divider(),
                  _LocaleSelector(
                    currentLocale: locale,
                    supportedLocales: supportedLocales,
                    localeLabel: _localeLabel,
                    onLocaleChanged: onLocaleChanged,
                  ),
                  const Divider(),
                  if (isAuthenticated)
                    _NavItem(
                      icon: Icons.logout,
                      label: 'Logout',
                      selected: false,
                      isDestructive: true,
                      onTap: onLogout,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Image.asset('assets/logo.png', width: 32, height: 32),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Agroecology Map AI',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 20),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _navigate(BuildContext context, String route) {
    Navigator.of(context).pop();
    context.go(route);
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final bool isDestructive;
  final VoidCallback? onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    this.isDestructive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDestructive
        ? AppColors.error
        : selected
        ? AppColors.primary700
        : AppColors.textSecondary;

    return Material(
      color: selected ? AppColors.primary100 : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(icon, size: 20, color: color),
              const SizedBox(width: 12),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LocaleSelector extends StatelessWidget {
  final String currentLocale;
  final List<String> supportedLocales;
  final String Function(String) localeLabel;
  final ValueChanged<String>? onLocaleChanged;

  const _LocaleSelector({
    required this.currentLocale,
    required this.supportedLocales,
    required this.localeLabel,
    required this.onLocaleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.language, size: 18, color: AppColors.textSecondary),
          const SizedBox(width: 12),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: currentLocale,
                isExpanded: true,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
                items: supportedLocales.map((loc) {
                  return DropdownMenuItem(
                    value: loc,
                    child: Text(localeLabel(loc)),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    onLocaleChanged?.call(value);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
