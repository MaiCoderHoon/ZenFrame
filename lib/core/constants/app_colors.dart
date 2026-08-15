import 'package:flutter/material.dart';

/// Centralized color palette for PaletteSnap.
/// Inspired by modern premium design tools (e.g., Charcoal/Gray surfaces, Indigo/Violet accents).
class AppColors {
  AppColors._();

  // Brand Accents
  static const Color primary = Color(0xFF4F46E5); // Indigo 600
  static const Color primaryLight = Color(0xFF818CF8); // Indigo 400
  static const Color primaryDark = Color(0xFF3730A3); // Indigo 800
  
  static const Color secondary = Color(0xFF8B5CF6); // Violet 500
  static const Color secondaryLight = Color(0xFFA78BFA); // Violet 400

  // Dark Theme Surfaces
  static const Color darkBackground = Color(0xFF0F0F11); // Near black/deep charcoal
  static const Color darkSurface = Color(0xFF18181B); // Card/Sidebar surface
  static const Color darkSurfaceVariant = Color(0xFF27272A); // Active/Hover surface
  static const Color darkBorder = Color(0xFF2E2E33); // Thin dividing borders
  
  // Light Theme Surfaces
  static const Color lightBackground = Color(0xFFF9FAFB); // Cool gray 50
  static const Color lightSurface = Color(0xFFFFFFFF); // Pure white card/sidebar
  static const Color lightSurfaceVariant = Color(0xFFF3F4F6); // Active/Hover surface
  static const Color lightBorder = Color(0xFFE5E7EB); // Thin dividing borders

  // Dark Theme Text
  static const Color darkTextPrimary = Color(0xFFF3F4F6); // Gray 100
  static const Color darkTextSecondary = Color(0xFF9CA3AF); // Gray 400
  static const Color darkTextMuted = Color(0xFF6B7280); // Gray 500

  // Light Theme Text
  static const Color lightTextPrimary = Color(0xFF111827); // Gray 900
  static const Color lightTextSecondary = Color(0xFF4B5563); // Gray 600
  static const Color lightTextMuted = Color(0xFF9CA3AF); // Gray 400

  // Semantic Feedback Colors
  static const Color success = Color(0xFF10B981); // Emerald 500
  static const Color successLight = Color(0xFFD1FAE5); // Emerald 100
  static const Color warning = Color(0xFFF59E0B); // Amber 500
  static const Color warningLight = Color(0xFFFEF3C7); // Amber 100
  static const Color error = Color(0xFFEF4444); // Rose 500
  static const Color errorLight = Color(0xFFFEE2E2); // Rose 100
  
  // Shadow Colors
  static const Color shadowDark = Color(0x3F000000);
  static const Color shadowLight = Color(0x0F000000);
}
