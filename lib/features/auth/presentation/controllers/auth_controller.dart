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
  final DateTime? authBlockedUntil;

  const AuthState({
    this.status = AuthStatus.unknown,
    this.session,
    this.profile,
    this.errorMessage,
    this.authBlockedUntil,
  });

  bool get isAuthenticated => status == AuthStatus.authenticated;
  bool get isLoading =>
      status == AuthStatus.unknown || status == AuthStatus.restoring;

  AuthState copyWith({
    AuthStatus? status,
    AuthSession? session,
    User? profile,
    String? errorMessage,
    DateTime? authBlockedUntil,
    bool clearError = false,
    bool clearSession = false,
    bool clearRateLimit = false,
  }) {
    return AuthState(
      status: status ?? this.status,
      session: clearSession ? null : (session ?? this.session),
      profile: profile ?? this.profile,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      authBlockedUntil: clearRateLimit
          ? null
          : (authBlockedUntil ?? this.authBlockedUntil),
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
    state = state.copyWith(
      status: AuthStatus.restoring,
      clearError: true,
      clearRateLimit: true,
    );

    try {
      final session = await _authRepository.login(
        email: email,
        password: password,
      );
      state = state.copyWith(
        status: AuthStatus.authenticated,
        session: session,
      );
    } on RateLimitException catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: e.message,
        authBlockedUntil: e.blockedUntil,
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
    state = state.copyWith(
      status: AuthStatus.restoring,
      clearError: true,
      clearRateLimit: true,
    );

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
    } on RateLimitException catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: e.message,
        authBlockedUntil: e.blockedUntil,
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

  Future<void> logout({bool revokeRemote = true}) async {
    final userId = state.session?.userId;
    await _authRepository.logout(revokeRemote: revokeRemote);
    if (userId != null) {
      await _chatStorage.clearChatHistory(userId);
    }
    state = state.copyWith(
      status: AuthStatus.unauthenticated,
      clearSession: true,
      profile: null,
    );
  }

  void clearAuthRateLimit() {
    state = state.copyWith(clearError: true, clearRateLimit: true);
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

  void showSuccessMessage(String message) {
    state = state.copyWith(
      status: AuthStatus.unauthenticated,
      errorMessage: message,
    );
  }
}
