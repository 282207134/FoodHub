/// Dark theme derived by inverting light-theme palette.
library;

import 'package:food_hub/core/theme.dart';
import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData data() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimary,
          brightness: Brightness.dark,
          onPrimary: kWhite,
          primary: kPrimary,
          surface: const Color(0xFF1C1C2E),
          onSurface: const Color(0xFFE5E7EB),
        ),
        scaffoldBackgroundColor: const Color(0xFF0F0F1A),
        fontFamily: 'Inter',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1C1C2E),
          foregroundColor: kWhite,
          elevation: 0,
          centerTitle: true,
        ),
        textTheme: TextTheme(
          headlineLarge: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: kWhite, fontFamily: 'Inter'),
          headlineMedium: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: kWhite, fontFamily: 'Inter'),
          headlineSmall: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: kWhite, fontFamily: 'Inter'),
          titleLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: kWhite, fontFamily: 'Inter'),
          titleMedium: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: kWhite, fontFamily: 'Inter'),
          bodyLarge: const TextStyle(fontSize: 16, color: kWhite, fontFamily: 'Inter'),
          bodyMedium: const TextStyle(fontSize: 14, color: Color(0xFFCBD5E1), fontFamily: 'Inter'),
          bodySmall: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8), fontFamily: 'Inter'),
          labelLarge: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: kWhite, fontFamily: 'Inter'),
          labelMedium: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF94A3B8), fontFamily: 'Inter'),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimary,
            foregroundColor: kWhite,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: kWhite,
            side: const BorderSide(color: Color(0xFF374151)),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF1C1C2E),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF94A3B8), fontFamily: 'Inter'),
          labelStyle: const TextStyle(fontSize: 14, color: Color(0xFF94A3B8), fontFamily: 'Inter'),
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF1C1C2E),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Color(0xFF2D3748)),
          ),
          margin: EdgeInsets.zero,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF1C1C2E),
          selectedItemColor: kPrimary,
          unselectedItemColor: Color(0xFF94A3B8),
          type: BottomNavigationBarType.fixed,
          elevation: 8,
        ),
        iconTheme: const IconThemeData(color: Color(0xFFE5E7EB), size: 24),
      );
}
