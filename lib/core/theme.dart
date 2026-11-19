/// Project-wide color tokens extracted from Pixso "Food Delivery UI Kit" Light Version.
/// Dark theme values are stored in lib/core/dark_theme.dart.
library;

import 'package:flutter/material.dart';

/// Primary accent – used for CTAs, active states, price display.
const Color kPrimary = Color(0xFFE84B3D);

/// Secondary accent – used for badges, highlights.
const Color kSecondary = Color(0xFFFF9F0A);

/// Surface background for cards / lists.
const Color kSurface = Color(0xFFF5F5F7);

/// Main text color.
const Color kTextPrimary = Color(0xFF1A1A2E);

/// Subtle/muted text.
const Color kTextSecondary = Color(0xFF6B7280);

/// Border & divider color.
const Color kBorder = Color(0xFFE5E7EB);

/// Success green.
const Color kSuccess = Color(0xFF10B981);

/// Warning amber.
const Color kWarning = Color(0xFFF59E0B);

/// Error red.
const Color kError = Color(0xFFEF4444);

/// White surface used on cards.
const Color kWhite = Colors.white;

/// Light grey page background.
const Color kBgLight = Color(0xFFF9FAFB);

/// Icon colour on light background.
const Color kIconLight = Color(0xFF374151);

/// Icon colour on white card.
const Color kIconDark = Color(0xFF1F2937);

TextStyle _textStyle(double size, {Color? color, FontWeight? weight}) => TextStyle(
      fontFamily: 'Inter',
      fontSize: size,
      color: color ?? kTextPrimary,
      fontWeight: weight ?? FontWeight.normal,
      height: 1.4,
    );

class AppTheme {
  static ThemeData light() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimary, brightness: Brightness.light),
        scaffoldBackgroundColor: kBgLight,
        fontFamily: 'Inter',
        appBarTheme: AppBarTheme(
          backgroundColor: kWhite,
          foregroundColor: kTextPrimary,
          elevation: 0,
          centerTitle: true,
        ),
        textTheme: TextTheme(
          headlineLarge: _textStyle(28, weight: FontWeight.bold),
          headlineMedium: _textStyle(22, weight: FontWeight.bold),
          headlineSmall: _textStyle(18, weight: FontWeight.w600),
          titleLarge: _textStyle(16, weight: FontWeight.w600),
          titleMedium: _textStyle(14, weight: FontWeight.w500),
          bodyLarge: _textStyle(16),
          bodyMedium: _textStyle(14),
          bodySmall: _textStyle(12, color: kTextSecondary),
          labelLarge: _textStyle(14, weight: FontWeight.w600),
          labelMedium: _textStyle(12, weight: FontWeight.w500),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimary,
            foregroundColor: kWhite,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            textStyle: _textStyle(16, weight: FontWeight.w600, color: kWhite),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: kTextPrimary,
            side: const BorderSide(color: kBorder),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: kSurface,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          hintStyle: _textStyle(14, color: kTextSecondary),
          labelStyle: _textStyle(14, color: kTextSecondary),
        ),
        cardTheme: CardThemeData(
          color: kWhite,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: kBorder)),
          margin: EdgeInsets.zero,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: kWhite,
          selectedItemColor: kPrimary,
          unselectedItemColor: kTextSecondary,
          type: BottomNavigationBarType.fixed,
          elevation: 8,
        ),
        iconTheme: const IconThemeData(color: kIconDark, size: 24),
        sliderTheme: SliderThemeData(
          activeTrackColor: kPrimary,
          inactiveTrackColor: kBorder,
          thumbColor: kPrimary,
          overlayColor: kPrimary.withOpacity(0.1),
          trackHeight: 4,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
        ),
      );

  static TextSpan bullet(String text, {TextStyle? style}) => TextSpan(
        text: '•  ',
        style: style ?? _textStyle(14),
        children: [TextSpan(text: text, style: style ?? _textStyle(14))],
      );
}
