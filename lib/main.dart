import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bootstrap/providers.dart';
import 'core/config/environment.dart';
import 'core/constants/app_constants.dart';
import 'core/navigation/router.dart';
import 'core/theme/app_theme.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const defines = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:8000',
  );

  final environment = Environment(apiBaseUrl: defines);

  final prefs = await SharedPreferences.getInstance();
  final savedLocale = prefs.getString(AppConstants.localeStorageKey);
  final initialLocale =
      (savedLocale != null &&
          AppConstants.supportedLocales.contains(savedLocale))
      ? savedLocale
      : AppConstants.defaultLocale;

  runApp(
    ProviderScope(
      overrides: [
        environmentProvider.overrideWithValue(environment),
        localeProvider.overrideWith((ref) => LocaleNotifier(initialLocale)),
      ],
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
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _router = createRouter(_authNotifier);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authControllerProvider, (_, _) {
      _authNotifier.notify();
    });

    if (!_initialized) {
      _initialized = true;
      Future.microtask(() {
        if (mounted) {
          ref.read(authControllerProvider.notifier).restoreSession();
        }
      });
    }

    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'Agroecology Map AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      locale: _localeFromString(locale),
      localeListResolutionCallback: (locales, supportedLocales) {
        for (final loc in locales ?? <Locale>[]) {
          if (supportedLocales.contains(Locale(loc.languageCode))) {
            return Locale(loc.languageCode);
          }
        }
        return supportedLocales.first;
      },
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
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
