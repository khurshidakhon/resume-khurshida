import 'package:flutter/material.dart';

class AppTheme {
  // Brand purples
  static const Color purple = Color(0xFF7C3AED);
  static const Color purpleLight = Color(0xFFA78BFA);
  static const Color purpleSoft = Color(0xFFEDE9FE);
  static const Color purpleMid = Color(0xFFDDD6FE);
  static const Color purpleDark = Color(0xFF5B21B6);

  // Backgrounds
  static const Color surface = Color(0xFFFAF9FF);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color heroBg = Color(0xFF1A0533);
  static const Color heroCard = Color(0xFF2D0F4E);

  // Text
  static const Color textPrimary = Color(0xFF1E1033);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textLight = Color(0xFFD1D5DB);

  // UI
  static const Color divider = Color(0xFFEDE9FE);
  static const Color tagBg = Color(0xFFF5F3FF);
  static const Color tagBorder = Color(0xFFDDD6FE);

  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: surface,
        colorScheme: const ColorScheme.light(
          primary: purple,
          surface: surface,
          onSurface: textPrimary,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: -1.5,
          ),
          displayMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: -1,
          ),
          headlineLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: textPrimary,
          ),
          headlineMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          titleLarge: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
          titleMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
          bodyLarge: TextStyle(
            fontSize: 15,
            color: textSecondary,
            height: 1.7,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: textSecondary,
            height: 1.6,
          ),
          labelLarge: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: purple,
            letterSpacing: 1.8,
          ),
        ),
      );
}
