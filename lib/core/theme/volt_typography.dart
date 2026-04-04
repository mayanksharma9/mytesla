import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'volt_colors.dart';

class VoltTypography {
  static TextStyle displayLarge({Color? color}) => GoogleFonts.manrope(
        fontSize: 48,
        fontWeight: FontWeight.w800,
        height: 56 / 48,
        letterSpacing: -1.5,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle displayMedium({Color? color}) => GoogleFonts.manrope(
        fontSize: 36,
        fontWeight: FontWeight.w800,
        height: 44 / 36,
        letterSpacing: -0.5,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle displaySmall({Color? color}) => GoogleFonts.manrope(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: 36 / 28,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle headlineLarge({Color? color}) => GoogleFonts.manrope(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        height: 32 / 24,
        letterSpacing: -0.5,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle headlineMedium({Color? color}) => GoogleFonts.manrope(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 28 / 20,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle headlineSmall({Color? color}) => GoogleFonts.manrope(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 24 / 18,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle bodyLarge({Color? color}) => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle bodyMedium({Color? color}) => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle bodySmall({Color? color}) => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 16 / 12,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle labelLarge({Color? color}) => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 20 / 14,
        letterSpacing: 0.1,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle labelMedium({Color? color}) => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 16 / 12,
        letterSpacing: 0.5,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle labelSmall({Color? color}) => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        height: 14 / 10,
        letterSpacing: 1.0,
        color: color ?? VoltColors.textPrimaryDark,
      );

  static TextStyle monoData({Color? color}) => GoogleFonts.jetBrainsMono(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        color: color ?? VoltColors.textPrimaryDark,
      );
}
