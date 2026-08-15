import 'package:flutter/material.dart';

/// Premium typography styles for PaletteSnap.
/// Typography-focused with tighter letter spacing for headlines (sleek design tool feel) 
/// and readable line heights for body copy.
class AppTypography {
  AppTypography._();

  // Font Family Names (Uses default system fonts, which are highly polished:
  // San Francisco on macOS/iOS, Segoe UI on Windows, Roboto on Android/Linux)
  
  static const TextStyle display = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.8,
    height: 1.2,
  );

  static const TextStyle headline = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    height: 1.3,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.2,
    height: 1.4,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.1,
    height: 1.4,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.5,
  );

  static const TextStyle label = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 1.2,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.4,
  );
  
  static const TextStyle mono = TextStyle(
    fontSize: 12.0,
    fontFamily: 'monospace',
    fontWeight: FontWeight.w500,
    letterSpacing: 0.0,
    height: 1.4,
  );
}
