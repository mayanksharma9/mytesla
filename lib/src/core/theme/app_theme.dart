import 'package:flutter/material.dart';
import '../responsive/breakpoints.dart';

class AppTheme {
  static ThemeData light(SizeClass size) => _base(size).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0066FF),
          brightness: Brightness.light,
        ),
      );

  static ThemeData dark(SizeClass size) => _base(size).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4DA3FF),
          brightness: Brightness.dark,
        ),
      );

  static ThemeData _base(SizeClass size) {
    final radius = size.isTablet ? 20.0 : 16.0;
    final spacing = size.isTablet ? 20.0 : 12.0;

    final inputDecoration = InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      contentPadding: EdgeInsets.all(spacing),
    );

    // ⬇️ Use CardThemeData instead of CardTheme
    final cardTheme = CardThemeData(
      elevation: 2,
      margin: EdgeInsets.all(spacing),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );

    final buttonStyle = FilledButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );

    return ThemeData(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      cardTheme: cardTheme, // now CardThemeData
      inputDecorationTheme: inputDecoration,
      filledButtonTheme: FilledButtonThemeData(style: buttonStyle),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
    );
  }
}
