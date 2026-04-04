import 'package:flutter/material.dart';
import 'volt_colors.dart';
import 'volt_typography.dart';
import 'theme_extensions.dart';

class VoltTheme {
  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: VoltColors.backgroundDark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: VoltColors.primary,
        brightness: Brightness.dark,
        primary: VoltColors.primary,
        surface: VoltColors.surfaceDark,
        onSurface: VoltColors.textPrimaryDark,
        error: VoltColors.error,
        surfaceContainerHighest: VoltColors.surfaceOverlayDark,
        surfaceContainer: VoltColors.surfaceElevatedDark,
      ),
      textTheme: _textTheme(VoltColors.textPrimaryDark),
      extensions: const [VoltThemeExtension.dark],
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: VoltColors.surfaceElevatedDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: 0,
      ),
    );
  }

  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: VoltColors.backgroundLight,
      colorScheme: ColorScheme.fromSeed(
        seedColor: VoltColors.primary,
        brightness: Brightness.light,
        primary: VoltColors.primary,
        surface: VoltColors.surfaceLight,
        onSurface: VoltColors.textPrimaryLight,
        error: VoltColors.error,
        surfaceContainerHighest: VoltColors.surfaceContainerHighest,
        surfaceContainer: VoltColors.surfaceContainer,
      ),
      textTheme: _textTheme(VoltColors.textPrimaryLight),
      extensions: const [VoltThemeExtension.light],
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: VoltColors.surfaceContainerLowest,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: 0,
        clipBehavior: Clip.antiAlias,
      ),
    );
  }

  static TextTheme _textTheme(Color textColor) {
    return TextTheme(
      displayLarge: VoltTypography.displayLarge(color: textColor),
      displayMedium: VoltTypography.displayMedium(color: textColor),
      displaySmall: VoltTypography.displaySmall(color: textColor),
      headlineLarge: VoltTypography.headlineLarge(color: textColor),
      headlineMedium: VoltTypography.headlineMedium(color: textColor),
      headlineSmall: VoltTypography.headlineSmall(color: textColor),
      bodyLarge: VoltTypography.bodyLarge(color: textColor),
      bodyMedium: VoltTypography.bodyMedium(color: textColor),
      bodySmall: VoltTypography.bodySmall(color: textColor),
      labelLarge: VoltTypography.labelLarge(color: textColor),
      labelMedium: VoltTypography.labelMedium(color: textColor),
      labelSmall: VoltTypography.labelSmall(color: textColor),
    );
  }
}
