class Environment {
  static const defaultApiBaseUrl = 'https://ai.agroecologymap.org';

  final String apiBaseUrl;

  const Environment({required this.apiBaseUrl});

  static Environment fromDartDefines(Map<String, String> defines) {
    return Environment(
      apiBaseUrl: defines['API_BASE_URL'] ?? defaultApiBaseUrl,
    );
  }
}
