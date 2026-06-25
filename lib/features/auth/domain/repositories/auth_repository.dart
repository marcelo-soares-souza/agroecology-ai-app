import '../entities/auth_session.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<AuthSession> login({required String email, required String password});

  Future<String> register({
    required String fullName,
    required String email,
    required String password,
    required String challengeId,
    required String challengeAnswer,
    bool privacyPolicyAccepted = false,
    bool tosAccepted = false,
    String locale = 'pt-BR',
  });

  Future<String> confirmEmail(String token);
  Future<String> resendConfirmation(String email);
  Future<String> requestPasswordReset(String email);
  Future<String> confirmPasswordReset({
    required String token,
    required String newPassword,
  });
  Future<AuthSession> refreshSession(String refreshToken);
  Future<void> logout({bool revokeRemote = true});
  Future<User> getMe();
  Future<User> updateMyProfile({String? fullName, String? about, String? link});
  Future<User> uploadAvatar(String filePath);
  Future<List<PublicUser>> listActiveUsers();
  Future<User> getUserBySlug(String slug);
  Future<AuthSession?> restoreSession();
  Future<Map<String, dynamic>> exportMyData();
  Future<String> requestDeleteAccount();
  Future<String> confirmDeleteAccount(String token);
}
