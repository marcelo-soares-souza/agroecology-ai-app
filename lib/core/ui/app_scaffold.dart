import 'package:flutter/material.dart';

import 'app_top_bar.dart';
import 'app_drawer.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final List<Widget>? actions;
  final bool showDrawer;
  final bool isAuthenticated;
  final String locale;
  final List<String> supportedLocales;
  final ValueChanged<String>? onLocaleChanged;
  final VoidCallback? onLogout;
  final Widget? bottomNavigationBar;

  const AppScaffold({
    super.key,
    required this.body,
    this.title,
    this.actions,
    this.showDrawer = true,
    this.isAuthenticated = false,
    this.locale = 'pt',
    this.supportedLocales = const ['pt', 'en', 'es', 'fr'],
    this.onLocaleChanged,
    this.onLogout,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showDrawer
          ? AppTopBar(
              onMenuTap: () => Scaffold.of(context).openDrawer(),
              actions: actions,
            )
          : (title != null
                ? AppTopBar(title: Text(title!), actions: actions)
                : null),
      drawer: showDrawer
          ? AppDrawer(
              isAuthenticated: isAuthenticated,
              locale: locale,
              supportedLocales: supportedLocales,
              onLocaleChanged: onLocaleChanged,
              onLogout: onLogout,
            )
          : null,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
