import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'bootstrap/providers.dart';
import 'core/config/environment.dart';
import 'core/navigation/router.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  const defines = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:8000',
  );

  final environment = Environment(apiBaseUrl: defines);

  runApp(
    ProviderScope(
      overrides: [environmentProvider.overrideWithValue(environment)],
      child: const AgroecologyMapApp(),
    ),
  );
}

class AgroecologyMapApp extends ConsumerStatefulWidget {
  const AgroecologyMapApp({super.key});

  @override
  ConsumerState<AgroecologyMapApp> createState() => _AgroecologyMapAppState();
}

class _AgroecologyMapAppState extends ConsumerState<AgroecologyMapApp> {
  final _authNotifier = AuthChangeNotifier();
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();

    _router = createRouter(_authNotifier);

    ref.listen(authControllerProvider, (_, _) {
      _authNotifier.notify();
    });

    Future.microtask(() {
      ref.read(authControllerProvider.notifier).restoreSession();
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'Agroecology Map AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      locale: _localeFromString(locale),
      supportedLocales: const [
        Locale('pt', 'BR'),
        Locale('en'),
        Locale('es'),
        Locale('fr'),
      ],
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      routerConfig: _router,
    );
  }

  Locale _localeFromString(String locale) {
    return switch (locale) {
      'pt' => const Locale('pt', 'BR'),
      'en' => const Locale('en'),
      'es' => const Locale('es'),
      'fr' => const Locale('fr'),
      _ => const Locale('pt', 'BR'),
    };
  }
}
