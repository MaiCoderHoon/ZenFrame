import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_sizes.dart';
import '../constants/app_animations.dart';

/// Variant sizes for the color swatch display.
enum SwatchSize { compact, medium, large }

/// A reusable color swatch component that displays a color with automatic
/// contrast-aware text overlays. Supports compact, medium, and large variants,
/// selected state, and copy-on-tap interaction.
class ColorSwatchWidget extends StatelessWidget {
  final Color color;
  final SwatchSize size;
  final bool showHex;
  final bool isSelected;
  final VoidCallback? onTap;

  const ColorSwatchWidget({
    super.key,
    required this.color,
    this.size = SwatchSize.medium,
    this.showHex = false,
    this.isSelected = false,
    this.onTap,
  });

  /// Returns true if text overlaid on this color should be dark for readability.
  bool get _usesDarkForeground => color.computeLuminance() > 0.4;

  Color get _foregroundColor =>
      _usesDarkForeground ? const Color(0xFF111111) : const Color(0xFFF5F5F5);

  String get _hexString =>
      '#${color.value.toRadixString(16).substring(2).toUpperCase()}';

  double get _dimension => switch (size) {
        SwatchSize.compact => 32.0,
        SwatchSize.medium => 44.0,
        SwatchSize.large => 64.0,
      };

  double get _borderRadius => switch (size) {
        SwatchSize.compact => AppSizes.radiusSm,
        SwatchSize.medium => AppSizes.radiusMd,
        SwatchSize.large => AppSizes.radiusLg,
      };

  double get _fontSize => switch (size) {
        SwatchSize.compact => 8.0,
        SwatchSize.medium => 9.0,
        SwatchSize.large => 11.0,
      };

  void _copyHex(BuildContext context) {
    Clipboard.setData(ClipboardData(text: _hexString));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied $_hexString'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        width: 200,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      label: 'Color swatch $_hexString',
      button: onTap != null,
      child: GestureDetector(
        onTap: onTap ?? () => _copyHex(context),
        child: AnimatedContainer(
          duration: AppAnimations.fast,
          curve: AppAnimations.curveStandard,
          width: _dimension,
          height: _dimension,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(_borderRadius),
            border: Border.all(
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.outline.withValues(alpha: 0.3),
              width: isSelected ? 2.0 : 1.0,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: theme.colorScheme.primary.withValues(alpha: 0.25),
                      blurRadius: 8.0,
                      spreadRadius: 1.0,
                    ),
                  ]
                : null,
          ),
          alignment: Alignment.center,
          child: (showHex || size == SwatchSize.large)
              ? Text(
                  _hexString,
                  style: TextStyle(
                    color: _foregroundColor,
                    fontSize: _fontSize,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'monospace',
                    letterSpacing: 0.3,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
