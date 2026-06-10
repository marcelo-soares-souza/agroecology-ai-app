import 'package:flutter/material.dart';

import 'app_top_bar.dart';
import 'app_drawer.dart';

class AppScaffold extends StatefulWidget {
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
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: widget.showDrawer
          ? AppTopBar(onMenuTap: _openDrawer, actions: widget.actions)
          : (widget.title != null
                ? AppTopBar(title: Text(widget.title!), actions: widget.actions)
                : null),
      drawer: widget.showDrawer
          ? AppDrawer(
              isAuthenticated: widget.isAuthenticated,
              locale: widget.locale,
              supportedLocales: widget.supportedLocales,
              onLocaleChanged: widget.onLocaleChanged,
              onLogout: widget.onLogout,
            )
          : null,
      body: widget.body,
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}
