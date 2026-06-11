import 'package:url_launcher/url_launcher.dart';

Uri normalizeExternalUri(String rawUrl) {
  final trimmed = rawUrl.trim();
  if (trimmed.isEmpty) {
    throw const FormatException('Empty URL');
  }

  final hasScheme =
      trimmed.startsWith('http://') || trimmed.startsWith('https://');
  return Uri.parse(hasScheme ? trimmed : 'https://$trimmed');
}

Future<bool> openExternalUrl(String rawUrl) {
  final uri = normalizeExternalUri(rawUrl);
  return launchUrl(uri, mode: LaunchMode.externalApplication);
}
