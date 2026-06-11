import '../entities/auth_session.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<AuthSession> login({required String email, required String password});

  Future<void> register({
    required String fullName,
    required String email,
    required String password,
    required String challengeId,
    required String challengeAnswer,
    bool privacyPolicyAccepted = false,
    bool tosAccepted = false,
    String locale = 'pt-BR',
  });

  Future<AuthSession> refreshSession(String refreshToken);
  Future<void> logout();
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
