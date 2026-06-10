import '../../../../core/http/api_client.dart';
import '../../../../core/storage/token_storage.dart';
import '../../../../core/utils/jwt.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_api_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiDataSource _remote;
  final TokenStorage _tokenStorage;
  final String _apiBaseUrl;

  AuthRepositoryImpl({
    required ApiClient apiClient,
    required this._tokenStorage,
    required this._apiBaseUrl,
  }) : _remote = AuthApiDataSource(apiClient);

  @override
  Future<AuthSession> login({
    required String email,
    required String password,
  }) async {
    final response = await _remote.login({
      'email': email,
      'password': password,
    });

    await _tokenStorage.saveTokens(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    );

    final payload = JwtPayload.fromToken(response.accessToken);
    final user = await getMe();

    return AuthSession(
      userId: payload.sub,
      email: payload.email ?? email,
      fullName: user.fullName,
      slug: user.slug,
      roles: user.roles,
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
      expiresAt: payload.exp,
    );
  }

  @override
  Future<void> register({
    required String fullName,
    required String email,
    required String password,
    required String challengeId,
    required String challengeAnswer,
    String locale = 'pt-BR',
  }) async {
    await _remote.register({
      'full_name': fullName,
      'email': email,
      'password': password,
      'challenge_id': challengeId,
      'challenge_answer': challengeAnswer,
      'locale': locale,
    });
  }

  @override
  Future<AuthSession> refreshSession(String refreshToken) async {
    final response = await _remote.refresh({'refresh_token': refreshToken});

    await _tokenStorage.saveTokens(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    );

    final payload = JwtPayload.fromToken(response.accessToken);
    final user = await getMe();

    return AuthSession(
      userId: payload.sub,
      email: payload.email ?? '',
      fullName: user.fullName,
      slug: user.slug,
      roles: user.roles,
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
      expiresAt: payload.exp,
    );
  }

  @override
  Future<void> logout() async {
    try {
      await _remote.logout();
    } catch (_) {}
    await _tokenStorage.clearTokens();
  }

  @override
  Future<User> getMe() async {
    final data = await _remote.getMe();
    return _mapUser(data);
  }

  @override
  Future<User> updateMyProfile({
    String? fullName,
    String? about,
    String? link,
  }) async {
    final body = <String, dynamic>{};
    if (fullName != null) body['full_name'] = fullName;
    if (about != null) body['about'] = about;
    if (link != null) body['link'] = link;

    final data = await _remote.updateMyProfile(body);
    return _mapUser(data);
  }

  @override
  Future<User> uploadAvatar(String filePath) async {
    final data = await _remote.uploadAvatar(filePath);
    return _mapUser(data);
  }

  @override
  Future<List<PublicUser>> listActiveUsers() async {
    final data = await _remote.listActiveUsers();
    return data.map(_mapPublicUser).toList();
  }

  @override
  Future<User> getUserBySlug(String slug) async {
    final data = await _remote.getUserBySlug(slug);
    return _mapUser(data);
  }

  @override
  Future<AuthSession?> restoreSession() async {
    final accessToken = await _tokenStorage.getAccessToken();
    if (accessToken == null) return null;

    final refreshToken = await _tokenStorage.getRefreshToken();

    try {
      final payload = JwtPayload.fromToken(accessToken);

      if (!payload.isExpired) {
        final user = await getMe();
        return AuthSession(
          userId: payload.sub,
          email: payload.email ?? user.email,
          fullName: user.fullName,
          slug: user.slug,
          roles: user.roles,
          accessToken: accessToken,
          refreshToken: refreshToken ?? '',
          expiresAt: payload.exp,
        );
      }
    } catch (_) {}

    if (refreshToken != null) {
      try {
        return await refreshSession(refreshToken);
      } catch (_) {
        await _tokenStorage.clearTokens();
      }
    }

    return null;
  }

  String _composeAvatarUrl(String? avatarUrl) {
    if (avatarUrl == null || avatarUrl.isEmpty) return '';
    if (avatarUrl.startsWith('http')) return avatarUrl;
    return '$_apiBaseUrl$avatarUrl';
  }

  User _mapUser(Map<String, dynamic> data) {
    return User(
      id: data['id'] as String? ?? '',
      email: data['email'] as String? ?? '',
      fullName: data['full_name'] as String? ?? '',
      status: data['status'] as String? ?? '',
      slug: data['slug'] as String? ?? '',
      locale: data['locale'] as String? ?? '',
      roles: List<String>.from(data['roles'] as List? ?? []),
      emailConfirmedAt: data['email_confirmed_at'] as String?,
      lastLoginAt: data['last_login_at'] as String?,
      createdAt: data['created_at'] as String? ?? '',
      updatedAt: data['updated_at'] as String? ?? '',
      about: data['about'] as String?,
      link: data['link'] as String?,
      avatarUrl: _composeAvatarUrl(data['avatar_url'] as String?),
      approvedSuggestionsCount: data['approved_suggestions_count'] as int? ?? 0,
    );
  }

  PublicUser _mapPublicUser(Map<String, dynamic> data) {
    return PublicUser(
      id: data['id'] as String? ?? '',
      fullName: data['full_name'] as String? ?? '',
      slug: data['slug'] as String? ?? '',
      locale: data['locale'] as String? ?? '',
      about: data['about'] as String?,
      link: data['link'] as String?,
      avatarUrl: _composeAvatarUrl(data['avatar_url'] as String?),
      approvedSuggestionsCount: data['approved_suggestions_count'] as int? ?? 0,
    );
  }
}
