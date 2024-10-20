import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Primary Colors
  static const Color primaryLight = Color(0xFFB8C8F0);    // Soft periwinkle blue
  static const Color primary = Color(0xFF8B9FE8);         // Muted blue
  static const Color primaryDark = Color(0xFF6B82D4);     // Deeper blue

  // Secondary Colors
  static const Color secondaryLight = Color(0xFFF0D6E8);  // Light pink
  static const Color secondary = Color(0xFFE5B5D6);       // Soft pink
  static const Color secondaryDark = Color(0xFFD494C3);   // Deeper pink

  // Accent Colors
  static const Color accentLight = Color(0xFFE2D6F0);     // Light lavender
  static const Color accent = Color(0xFFC9B5E8);          // Soft purple
  static const Color accentDark = Color(0xFFAF94D4);      // Deeper purple

  // Background Colors
  static const Color background = Color.fromARGB(255, 238, 238, 240);      // Very light blue-white
  static const Color surfaceLight = Color(0xFFFCF7FA);    // Light pink-white
  static const Color surface = Color(0xFFFAF8FC);         // Light purple-white

  // Text Colors
  static const Color textPrimary = Color(0xFF2E3A59);     // Deep blue-grey
  static const Color textSecondary = Color(0xFF6B7894);   // Medium blue-grey
  static const Color textTertiary = Color(0xFF9AA3BC);    // Light blue-grey

  // Status Colors
  static const Color success = Color(0xFF9CD4C3);         // Soft mint
  static const Color warning = Color(0xFFE8D5B5);         // Soft peach
  static const Color error = Color(0xFFE8B5B5);           // Soft coral
  
  // Gradient Collections
  static const List<Color> primaryGradient = [
    primaryLight,
    primary,
    primaryDark,
  ];

  static const List<Color> calmingGradient = [
    Color(0xFFE2D6F0),  // Light lavender
    Color(0xFFF0D6E8),  // Light pink
    Color(0xFFD6E2F0),  // Light blue
  ];

  static const List<Color> focusGradient = [
    Color(0xFFB8C8F0),  // Soft blue
    Color(0xFFC9B5E8),  // Soft purple
    Color(0xFFE5B5D6),  // Soft pink
  ];

  // Theme Data
  static ThemeData get theme => ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: background,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: Colors.white,
      secondary: secondary,
      onSecondary: Colors.white,
      error: error,
      onError: Colors.white,
      background: background,
      onBackground: textPrimary,
      surface: surface,
      onSurface: textPrimary,
    ),
    textTheme: GoogleFonts.urbanistTextTheme(
      const TextTheme(
      headlineLarge: TextStyle(color: textPrimary,fontSize: 24,fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(color: textPrimary),
      bodyLarge: TextStyle(color: textPrimary,fontSize: 20),
      bodyMedium: TextStyle(color: textSecondary,fontSize: 16),
      bodySmall: const TextStyle(color: textTertiary,fontSize: 12),
    ),),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
      ),
    ),
  );
}