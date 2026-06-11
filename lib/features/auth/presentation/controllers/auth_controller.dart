import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/storage/chat_storage.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/entities/user.dart';
import '../../data/repositories/auth_repository_impl.dart';

enum AuthStatus { unknown, restoring, authenticated, unauthenticated, failure }

class AuthState {
  final AuthStatus status;
  final AuthSession? session;
  final User? profile;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStatus.unknown,
    this.session,
    this.profile,
    this.errorMessage,
  });

  bool get isAuthenticated => status == AuthStatus.authenticated;
  bool get isLoading =>
      status == AuthStatus.unknown || status == AuthStatus.restoring;

  AuthState copyWith({
    AuthStatus? status,
    AuthSession? session,
    User? profile,
    String? errorMessage,
    bool clearError = false,
    bool clearSession = false,
  }) {
    return AuthState(
      status: status ?? this.status,
      session: clearSession ? null : (session ?? this.session),
      profile: profile ?? this.profile,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

class AuthController extends StateNotifier<AuthState> {
  final AuthRepositoryImpl _authRepository;
  final ChatStorage _chatStorage;

  AuthController({required this._authRepository, required this._chatStorage})
    : super(const AuthState());

  Future<void> restoreSession() async {
    state = state.copyWith(status: AuthStatus.restoring);

    try {
      final session = await _authRepository.restoreSession();
      if (session != null) {
        state = state.copyWith(
          status: AuthStatus.authenticated,
          session: session,
        );
      } else {
        state = state.copyWith(status: AuthStatus.unauthenticated);
      }
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(status: AuthStatus.restoring, clearError: true);

    try {
      final session = await _authRepository.login(
        email: email,
        password: password,
      );
      state = state.copyWith(
        status: AuthStatus.authenticated,
        session: session,
      );
    } on AppException catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: e.message,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: 'loginFailed',
      );
    }
  }

  Future<void> register({
    required String fullName,
    required String email,
    required String password,
    required String challengeId,
    required String challengeAnswer,
    bool privacyPolicyAccepted = false,
    bool tosAccepted = false,
    String locale = 'pt-BR',
  }) async {
    state = state.copyWith(status: AuthStatus.restoring, clearError: true);

    try {
      await _authRepository.register(
        fullName: fullName,
        email: email,
        password: password,
        challengeId: challengeId,
        challengeAnswer: challengeAnswer,
        privacyPolicyAccepted: privacyPolicyAccepted,
        tosAccepted: tosAccepted,
        locale: locale,
      );
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: 'registrationSuccess',
      );
    } on AppException catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: e.message,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: 'registrationFailed',
      );
    }
  }

  Future<void> logout() async {
    final userId = state.session?.userId;
    await _authRepository.logout();
    if (userId != null) {
      await _chatStorage.clearChatHistory(userId);
    }
    state = state.copyWith(
      status: AuthStatus.unauthenticated,
      clearSession: true,
      profile: null,
    );
  }

  Future<User> fetchProfile() async {
    try {
      final profile = await _authRepository.getMe();
      state = state.copyWith(profile: profile);
      return profile;
    } catch (e) {
      rethrow;
    }
  }

  Future<User> updateProfile({
    String? fullName,
    String? about,
    String? link,
  }) async {
    final profile = await _authRepository.updateMyProfile(
      fullName: fullName,
      about: about,
      link: link,
    );
    state = state.copyWith(profile: profile);
    return profile;
  }

  Future<User> uploadAvatar(String filePath) async {
    final profile = await _authRepository.uploadAvatar(filePath);
    state = state.copyWith(profile: profile);
    return profile;
  }

  Future<Map<String, dynamic>> exportMyData() async {
    return await _authRepository.exportMyData();
  }

  Future<String> requestDeleteAccount() async {
    return await _authRepository.requestDeleteAccount();
  }

  Future<String> confirmDeleteAccount(String token) async {
    return await _authRepository.confirmDeleteAccount(token);
  }

  void clearError() {
    state = state.copyWith(clearError: true);
  }
}
