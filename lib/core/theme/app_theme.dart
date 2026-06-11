import 'package:flutter/material.dart';

import 'app_tokens.dart';

class AppColors {
  static const primary = Color(0xFFd97706);
  static const primaryLight = Color(0xFFf59e0b);
  static const primaryDark = Color(0xFFb45309);
  static const primary50 = Color(0xFFfffbeb);
  static const primary100 = Color(0xFFfef3c7);
  static const primary200 = Color(0xFFfde68a);
  static const primary500 = Color(0xFFd97706);
  static const primary600 = Color(0xFFb45309);
  static const primary700 = Color(0xFF92400e);

  static const accent = Color(0xFFf59e0b);
  static const earth = Color(0xFFa16207);

  static const background = Color(0xFFffffff);
  static const surface = Color(0xFFffffff);
  static const sidebar = Color(0xFFfff7ed);
  static const sidebarHover = Color(0xFFfed7aa);

  static const textPrimary = Color(0xFF1c1917);
  static const textSecondary = Color(0xFF78716c);

  static const error = Color(0xFFdc2626);
  static const success = Color(0xFF16a34a);
  static const warning = Color(0xFFd97706);
  static const info = Color(0xFF2563eb);
}

class AppTheme {
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: Colors.white,
      primaryContainer: AppColors.primary200,
      onPrimaryContainer: AppColors.primary700,
      secondary: AppColors.primaryLight,
      onSecondary: Colors.white,
      secondaryContainer: AppColors.primary100,
      onSecondaryContainer: AppColors.primary700,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
      surfaceContainerHighest: AppColors.primary50,
      error: AppColors.error,
      onError: Colors.white,
      errorContainer: const Color(0xFFfecaca),
      onErrorContainer: const Color(0xFF991b1b),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: AppTokens.bodySize, height: 1.5),
        bodyMedium: TextStyle(fontSize: AppTokens.bodySize, height: 1.5),
        bodySmall: TextStyle(fontSize: AppTokens.metaSize, height: 1.4),
        labelLarge: TextStyle(
          fontSize: AppTokens.bodySize,
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          fontSize: AppTokens.metaSize,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          fontSize: AppTokens.pageTitleSize,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          fontSize: AppTokens.sectionTitleSize,
          fontWeight: FontWeight.w600,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 1,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: AppTokens.pageTitleSize,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.cardRadius),
          side: const BorderSide(color: AppColors.primary100, width: 1),
        ),
        margin: EdgeInsets.zero,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        labelStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.textSecondary,
        ),
        hintStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.textSecondary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: const TextStyle(
            fontSize: AppTokens.bodySize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary700,
          side: const BorderSide(color: AppColors.primary200),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: const TextStyle(
            fontSize: AppTokens.bodySize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.textSecondary,
          textStyle: const TextStyle(
            fontSize: AppTokens.metaSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.textSecondary),
      dividerTheme: const DividerThemeData(
        color: AppColors.primary100,
        thickness: 1,
      ),
      drawerTheme: const DrawerThemeData(backgroundColor: AppColors.sidebar),
    );
  }
}
