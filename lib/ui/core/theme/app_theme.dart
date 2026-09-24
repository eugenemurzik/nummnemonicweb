import 'package:material_ui/material_ui.dart';

/// Brand palette carried over from the original FlutterFlow theme.
abstract final class AppColors {
  static const primary = Color(0xFF7B61FF);
  static const background = Color(0xFF072C3B);
  static const surface = Color(0xFF1B1B2D);
  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFFA0A0B0);
  static const outline = Color(0xFFB0B0C0);
  static const error = Color(0xFFFF4C61);

  /// A lighter tint of [primary] for link text. [primary] itself is too dark
  /// on [background] to meet WCAG AA contrast for body-sized text.
  static const link = Color(0xFFB3A6FF);
}

abstract final class AppTheme {
  static const fontFamily = 'Inter';

  static ThemeData dark() {
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.dark,
        ).copyWith(
          primary: AppColors.primary,
          onPrimary: Colors.white,
          surface: AppColors.background,
          onSurface: AppColors.textPrimary,
          onSurfaceVariant: AppColors.textSecondary,
          surfaceContainer: AppColors.surface,
          outline: AppColors.outline,
          outlineVariant: AppColors.outline.withValues(alpha: 0.3),
          error: AppColors.error,
        );

    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: fontFamily,
      textTheme: _textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          for (final platform in TargetPlatform.values)
            platform: const FadeForwardsPageTransitionsBuilder(),
        },
      ),
    );
  }

  static const _textTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 64, fontWeight: FontWeight.w700),
    displayMedium: TextStyle(fontSize: 44, fontWeight: FontWeight.w700),
    displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
    headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
    headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(fontSize: 16, height: 1.6),
    bodyMedium: TextStyle(fontSize: 14, height: 1.5),
    bodySmall: TextStyle(fontSize: 12, height: 1.5),
    labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
  );
}
