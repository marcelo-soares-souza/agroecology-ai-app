class Environment {
  final String apiBaseUrl;

  const Environment({required this.apiBaseUrl});

  static Environment fromDartDefines(Map<String, String> defines) {
    return Environment(
      apiBaseUrl: defines['API_BASE_URL'] ?? 'http://localhost:8000',
    );
  }
}
