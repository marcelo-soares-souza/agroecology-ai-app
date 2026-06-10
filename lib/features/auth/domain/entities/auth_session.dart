class AuthSession {
  final String userId;
  final String email;
  final String fullName;
  final String slug;
  final List<String> roles;
  final String accessToken;
  final String refreshToken;
  final int expiresAt;

  const AuthSession({
    required this.userId,
    required this.email,
    required this.fullName,
    required this.slug,
    required this.roles,
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
  });

  bool get isExpired {
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    return expiresAt <= now;
  }
}
