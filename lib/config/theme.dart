import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF0000FF); // Deep blue from design
  static const secondary = Color(0xFF1E1E1E);
  static const background = Colors.white;
  static const navBarBackground = Color(0xFFF5F5F5);
  static const textPrimary = Color(0xFF1E1E1E);
  static const textSecondary = Color(0xFF757575);
  static const chipBackground = Color(0x80000000);
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'AlibabaSans',
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textSecondary,
        fontSize: 14,
      ),
    ),
  );
}
