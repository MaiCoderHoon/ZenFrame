import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../constants/app_typography.dart';

/// Customized premium Light and Dark ThemeData configuration for PaletteSnap.
class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: Colors.white,
        secondary: AppColors.secondary,
        onSecondary: Colors.white,
        error: AppColors.error,
        onError: Colors.white,
        surface: AppColors.lightSurface,
        onSurface: AppColors.lightTextPrimary,
        surfaceContainer: AppColors.lightSurfaceVariant,
        outline: AppColors.lightBorder,
      ),
      scaffoldBackgroundColor: AppColors.lightBackground,
      dividerTheme: const DividerThemeData(
        color: AppColors.lightBorder,
        thickness: 1.0,
        space: 1.0,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightBackground,
        foregroundColor: AppColors.lightTextPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypography.titleLarge.copyWith(color: AppColors.lightTextPrimary),
        iconTheme: const IconThemeData(color: AppColors.lightTextPrimary),
        shape: const Border(
          bottom: BorderSide(color: AppColors.lightBorder, width: 1.0),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: AppTypography.display.copyWith(color: AppColors.lightTextPrimary),
        displayMedium: AppTypography.display.copyWith(color: AppColors.lightTextPrimary),
        displaySmall: AppTypography.display.copyWith(color: AppColors.lightTextPrimary),
        headlineLarge: AppTypography.headline.copyWith(color: AppColors.lightTextPrimary),
        headlineMedium: AppTypography.headline.copyWith(color: AppColors.lightTextPrimary),
        headlineSmall: AppTypography.headline.copyWith(color: AppColors.lightTextPrimary),
        titleLarge: AppTypography.titleLarge.copyWith(color: AppColors.lightTextPrimary),
        titleMedium: AppTypography.titleMedium.copyWith(color: AppColors.lightTextPrimary),
        bodyLarge: AppTypography.bodyLarge.copyWith(color: AppColors.lightTextPrimary),
        bodyMedium: AppTypography.bodyMedium.copyWith(color: AppColors.lightTextPrimary),
        labelLarge: AppTypography.label.copyWith(color: AppColors.lightTextPrimary),
        labelMedium: AppTypography.label.copyWith(color: AppColors.lightTextSecondary),
        bodySmall: AppTypography.caption.copyWith(color: AppColors.lightTextSecondary),
      ),
      cardTheme: CardThemeData(
        color: AppColors.lightSurface,
        elevation: AppSizes.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          side: const BorderSide(color: AppColors.lightBorder, width: 1.0),
        ),
        margin: EdgeInsets.zero,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.lightSurface,
        elevation: 0,
        indicatorColor: AppColors.primary.withValues(alpha: 0.08),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primary, size: 22);
          }
          return const IconThemeData(color: AppColors.lightTextSecondary, size: 22);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final style = AppTypography.caption.copyWith(fontWeight: FontWeight.w500);
          if (states.contains(WidgetState.selected)) {
            return style.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600);
          }
          return style.copyWith(color: AppColors.lightTextSecondary);
        }),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: AppColors.lightSurface,
        elevation: 0,
        indicatorColor: AppColors.primary.withValues(alpha: 0.08),
        selectedIconTheme: const IconThemeData(color: AppColors.primary, size: 22),
        unselectedIconTheme: const IconThemeData(color: AppColors.lightTextSecondary, size: 22),
        selectedLabelTextStyle: AppTypography.caption.copyWith(
          color: AppColors.primary, 
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelTextStyle: AppTypography.caption.copyWith(
          color: AppColors.lightTextSecondary, 
          fontWeight: FontWeight.w500,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          minimumSize: const Size.fromHeight(AppSizes.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          ),
          textStyle: AppTypography.label.copyWith(color: Colors.white),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.lightTextPrimary,
          side: const BorderSide(color: AppColors.lightBorder, width: 1.0),
          minimumSize: const Size.fromHeight(AppSizes.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          ),
          textStyle: AppTypography.label,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          ),
          textStyle: AppTypography.label,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightSurfaceVariant,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.lg,
          vertical: AppSizes.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          borderSide: const BorderSide(color: AppColors.lightBorder, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          borderSide: const BorderSide(color: AppColors.error, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
        hintStyle: AppTypography.bodyMedium.copyWith(color: AppColors.lightTextMuted),
        labelStyle: AppTypography.bodyMedium.copyWith(color: AppColors.lightTextSecondary),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryLight,
        onPrimary: AppColors.darkBackground,
        secondary: AppColors.secondaryLight,
        onSecondary: Colors.white,
        error: AppColors.error,
        onError: Colors.white,
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkTextPrimary,
        surfaceContainer: AppColors.darkSurfaceVariant,
        outline: AppColors.darkBorder,
      ),
      scaffoldBackgroundColor: AppColors.darkBackground,
      dividerTheme: const DividerThemeData(
        color: AppColors.darkBorder,
        thickness: 1.0,
        space: 1.0,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.darkTextPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypography.titleLarge.copyWith(color: AppColors.darkTextPrimary),
        iconTheme: const IconThemeData(color: AppColors.darkTextPrimary),
        shape: const Border(
          bottom: BorderSide(color: AppColors.darkBorder, width: 1.0),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: AppTypography.display.copyWith(color: AppColors.darkTextPrimary),
        displayMedium: AppTypography.display.copyWith(color: AppColors.darkTextPrimary),
        displaySmall: AppTypography.display.copyWith(color: AppColors.darkTextPrimary),
        headlineLarge: AppTypography.headline.copyWith(color: AppColors.darkTextPrimary),
        headlineMedium: AppTypography.headline.copyWith(color: AppColors.darkTextPrimary),
        headlineSmall: AppTypography.headline.copyWith(color: AppColors.darkTextPrimary),
        titleLarge: AppTypography.titleLarge.copyWith(color: AppColors.darkTextPrimary),
        titleMedium: AppTypography.titleMedium.copyWith(color: AppColors.darkTextPrimary),
        bodyLarge: AppTypography.bodyLarge.copyWith(color: AppColors.darkTextPrimary),
        bodyMedium: AppTypography.bodyMedium.copyWith(color: AppColors.darkTextPrimary),
        labelLarge: AppTypography.label.copyWith(color: AppColors.darkTextPrimary),
        labelMedium: AppTypography.label.copyWith(color: AppColors.darkTextSecondary),
        bodySmall: AppTypography.caption.copyWith(color: AppColors.darkTextSecondary),
      ),
      cardTheme: CardThemeData(
        color: AppColors.darkSurface,
        elevation: AppSizes.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          side: const BorderSide(color: AppColors.darkBorder, width: 1.0),
        ),
        margin: EdgeInsets.zero,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.darkSurface,
        elevation: 0,
        indicatorColor: AppColors.primaryLight.withValues(alpha: 0.08),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primaryLight, size: 22);
          }
          return const IconThemeData(color: AppColors.darkTextSecondary, size: 22);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final style = AppTypography.caption.copyWith(fontWeight: FontWeight.w500);
          if (states.contains(WidgetState.selected)) {
            return style.copyWith(color: AppColors.primaryLight, fontWeight: FontWeight.w600);
          }
          return style.copyWith(color: AppColors.darkTextSecondary);
        }),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: AppColors.darkSurface,
        elevation: 0,
        indicatorColor: AppColors.primaryLight.withValues(alpha: 0.08),
        selectedIconTheme: const IconThemeData(color: AppColors.primaryLight, size: 22),
        unselectedIconTheme: const IconThemeData(color: AppColors.darkTextSecondary, size: 22),
        selectedLabelTextStyle: AppTypography.caption.copyWith(
          color: AppColors.primaryLight, 
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelTextStyle: AppTypography.caption.copyWith(
          color: AppColors.darkTextSecondary, 
          fontWeight: FontWeight.w500,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryLight,
          foregroundColor: AppColors.darkBackground,
          elevation: 0,
          minimumSize: const Size.fromHeight(AppSizes.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          ),
          textStyle: AppTypography.label.copyWith(color: AppColors.darkBackground, fontWeight: FontWeight.w700),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.darkTextPrimary,
          side: const BorderSide(color: AppColors.darkBorder, width: 1.0),
          minimumSize: const Size.fromHeight(AppSizes.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          ),
          textStyle: AppTypography.label,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          ),
          textStyle: AppTypography.label,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurfaceVariant,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.lg,
          vertical: AppSizes.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          borderSide: const BorderSide(color: AppColors.darkBorder, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          borderSide: const BorderSide(color: AppColors.primaryLight, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          borderSide: const BorderSide(color: AppColors.error, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
        hintStyle: AppTypography.bodyMedium.copyWith(color: AppColors.darkTextMuted),
        labelStyle: AppTypography.bodyMedium.copyWith(color: AppColors.darkTextSecondary),
      ),
    );
  }
}
