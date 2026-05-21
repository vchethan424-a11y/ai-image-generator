import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor:
        const Color(0xFF0F172A),

    primaryColor:
        const Color(0xFF7C3AED),

    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF7C3AED),
      secondary: Color(0xFF06B6D4),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF111827),
      elevation: 0,
      centerTitle: true,
    ),

    elevatedButtonTheme:
        ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            const Color(0xFF7C3AED),

        foregroundColor: Colors.white,

        minimumSize:
            const Size(double.infinity, 55),

        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(14),
        ),
      ),
    ),

    inputDecorationTheme:
        InputDecorationTheme(
      filled: true,

      fillColor:
          const Color(0xFF1E293B),

      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(14),

        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(14),

        borderSide: const BorderSide(
          color: Color(0xFF7C3AED),
        ),
      ),
    ),
  );
}