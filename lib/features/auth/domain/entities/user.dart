class User {
  final String id;
  final String email;
  final String fullName;
  final String status;
  final String slug;
  final String locale;
  final List<String> roles;
  final String? emailConfirmedAt;
  final String? lastLoginAt;
  final String createdAt;
  final String updatedAt;
  final String? about;
  final String? link;
  final String? avatarUrl;
  final int approvedSuggestionsCount;

  const User({
    required this.id,
    required this.email,
    required this.fullName,
    required this.status,
    required this.slug,
    required this.locale,
    required this.roles,
    this.emailConfirmedAt,
    this.lastLoginAt,
    required this.createdAt,
    required this.updatedAt,
    this.about,
    this.link,
    this.avatarUrl,
    this.approvedSuggestionsCount = 0,
  });
}

class PublicUser {
  final String id;
  final String fullName;
  final String slug;
  final String locale;
  final String? about;
  final String? link;
  final String? avatarUrl;
  final int approvedSuggestionsCount;

  const PublicUser({
    required this.id,
    required this.fullName,
    required this.slug,
    required this.locale,
    this.about,
    this.link,
    this.avatarUrl,
    this.approvedSuggestionsCount = 0,
  });
}
