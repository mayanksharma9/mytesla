import 'package:flutter/material.dart';
import 'volt_colors.dart';

class VoltTypography {
  static const String _primaryFont = 'Inter'; // Fallback as per spec
  static const String _monoFont = 'JetBrains Mono'; // Fallback as per spec

  static TextStyle displayLarge({Color? color}) => TextStyle(
        fontFamily: _primaryFont,
        fontSize: 48,
        fontWeight: FontWeight.w700,
        height: 56 / 48,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle displayMedium({Color? color}) => TextStyle(
        fontFamily: _primaryFont,
        fontSize: 36,
        fontWeight: FontWeight.w700,
        height: 44 / 36,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle displaySmall({Color? color}) => TextStyle(
        fontFamily: _primaryFont,
        fontSize: 28,
        fontWeight: FontWeight.w600,
        height: 36 / 28,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle headlineLarge({Color? color}) => TextStyle(
        fontFamily: _primaryFont,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 32 / 24,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle headlineMedium({Color? color}) => TextStyle(
        fontFamily: _primaryFont,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 28 / 20,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle headlineSmall({Color? color}) => TextStyle(
        fontFamily: _primaryFont,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 24 / 18,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle bodyLarge({Color? color}) => TextStyle(
        fontFamily: _primaryFont,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle bodyMedium({Color? color}) => TextStyle(
        fontFamily: _primaryFont,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle bodySmall({Color? color}) => TextStyle(
        fontFamily: _primaryFont,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 16 / 12,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle labelLarge({Color? color}) => TextStyle(
        fontFamily: _primaryFont,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 20 / 14,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle labelMedium({Color? color}) => TextStyle(
        fontFamily: _primaryFont,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 16 / 12,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle labelSmall({Color? color}) => TextStyle(
        fontFamily: _primaryFont,
        fontSize: 10,
        fontWeight: FontWeight.w500,
        height: 14 / 10,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle monoData({Color? color}) => TextStyle(
        fontFamily: _monoFont,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        color: color ?? VoltColors.textPrimaryDark,
      );
}
