
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF0054A4),
    brightness: Brightness.dark,
    background: const Color(0xFF121212),
  ),
  scaffoldBackgroundColor: const Color(0xFF121212),
  textTheme: GoogleFonts.robotoTextTheme().apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[800],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(color: Colors.grey[400]),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF0054A4),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
    ),
  ),
);
