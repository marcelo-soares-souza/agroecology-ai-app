import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/config/environment.dart';
import '../core/constants/app_constants.dart';
import '../core/http/api_client.dart';
import '../core/storage/chat_storage.dart';
import '../core/storage/token_storage.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/auth/presentation/controllers/auth_controller.dart';

final environmentProvider = Provider<Environment>((ref) {
  throw UnimplementedError('Environment must be set via override');
});

final tokenStorageProvider = Provider<TokenStorage>((ref) {
  return TokenStorage();
});

final chatStorageProvider = Provider<ChatStorage>((ref) {
  return ChatStorage();
});

final apiClientProvider = Provider<ApiClient>((ref) {
  final env = ref.watch(environmentProvider);
  final tokenStorage = ref.watch(tokenStorageProvider);
  final authFailure = ref.watch(_authFailureNotifierProvider);

  return ApiClient(
    environment: env,
    tokenStorage: tokenStorage,
    onAuthFailure: () => authFailure.add(null),
  );
});

final _authFailureNotifierProvider = Provider<StreamController<void>>((ref) {
  return StreamController<void>.broadcast();
});

final authFailureStreamProvider = StreamProvider<void>((ref) {
  return ref.watch(_authFailureNotifierProvider).stream;
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final tokenStorage = ref.watch(tokenStorageProvider);
  final env = ref.watch(environmentProvider);

  return AuthRepositoryImpl(
    apiClient: apiClient,
    tokenStorage: tokenStorage,
    apiBaseUrl: env.apiBaseUrl,
  );
});

final authControllerProvider =
    StateNotifierProvider.autoDispose<AuthController, AuthState>((ref) {
      final authRepo = ref.watch(authRepositoryProvider) as AuthRepositoryImpl;
      final chatStorage = ref.watch(chatStorageProvider);

      final controller = AuthController(
        authRepository: authRepo,
        chatStorage: chatStorage,
      );

      ref.listen(authFailureStreamProvider, (_, _) {
        controller.logout();
      });

      return controller;
    });

final localeProvider = StateNotifierProvider<LocaleNotifier, String>((ref) {
  return LocaleNotifier();
});

class LocaleNotifier extends StateNotifier<String> {
  LocaleNotifier() : super(AppConstants.defaultLocale) {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(AppConstants.localeStorageKey);
    if (saved != null && AppConstants.supportedLocales.contains(saved)) {
      state = saved;
    }
  }

  Future<void> setLocale(String locale) async {
    if (!AppConstants.supportedLocales.contains(locale)) return;
    state = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.localeStorageKey, locale);
  }

  Locale get flutterLocale {
    return switch (state) {
      'pt' => const Locale('pt', 'BR'),
      'en' => const Locale('en'),
      'es' => const Locale('es'),
      'fr' => const Locale('fr'),
      _ => const Locale('pt', 'BR'),
    };
  }
}
