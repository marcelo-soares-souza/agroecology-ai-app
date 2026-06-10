import 'dart:convert';

class JwtPayload {
  final String sub;
  final List<String> roles;
  final int exp;
  final int iat;
  final String? email;
  final String? fullName;

  const JwtPayload({
    required this.sub,
    required this.roles,
    required this.exp,
    required this.iat,
    this.email,
    this.fullName,
  });

  bool get isExpired {
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    return exp <= now;
  }

  factory JwtPayload.fromToken(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw const FormatException('Invalid JWT format');
    }

    String payload = parts[1];
    switch (payload.length % 4) {
      case 2:
        payload += '==';
      case 3:
        payload += '=';
    }

    final decoded = utf8.decode(base64Url.decode(payload));
    final json = jsonDecode(decoded) as Map<String, dynamic>;

    return JwtPayload(
      sub: json['sub'] as String,
      roles: List<String>.from(json['roles'] as List? ?? []),
      exp: json['exp'] as int,
      iat: json['iat'] as int,
      email: json['email'] as String?,
      fullName: json['full_name'] as String?,
    );
  }
}
