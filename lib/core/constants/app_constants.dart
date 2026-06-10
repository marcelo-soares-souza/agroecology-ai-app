class AppConstants {
  static const appName = 'Agroecology Map AI';
  static const betaLabel = 'BETA';
  static const kofiUrl = 'https://ko-fi.com/agroecologymap';

  static const passwordMinLength = 8;
  static const passwordMaxLength = 128;
  static const fullNameMaxLength = 200;
  static const emailMaxLength = 320;
  static const questionMinLength = 1;
  static const questionMaxLength = 2000;
  static const aboutMaxLength = 4096;
  static const linkMaxLength = 2000;
  static const avatarMaxSizeMB = 5;
  static const avatarMaxSizeBytes = 5 * 1024 * 1024;

  static const pollIntervalSeconds = 2;
  static const maxPollRetries = 300;
  static const chatHistoryMaxMessages = 6;
  static const chatLocalStorageMaxMessages = 100;

  static const supportedLocales = ['pt', 'en', 'es', 'fr'];
  static const defaultLocale = 'en';

  static const tokenStorageAccessKey = 'agroecology_access_token';
  static const tokenStorageRefreshKey = 'agroecology_refresh_token';
  static const chatStorageKey = 'agroecology_chat_messages';
  static const localeStorageKey = 'agroecology_locale';
}
