import 'package:flutter/animation.dart';

/// Centralized animation durations and curves to maintain subtle, premium motion.
class AppAnimations {
  AppAnimations._();

  // Durations
  static const Duration instant = Duration.zero;
  static const Duration hover = Duration(milliseconds: 150);
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration standard = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);

  // Curves
  static const Curve curveStandard = Curves.easeInOutCubic;
  static const Curve curveEnter = Curves.easeOutCubic;
  static const Curve curveExit = Curves.easeInCubic;
  
  // Custom design-tool-inspired springy curve (decelerating smooth entry)
  static const Curve curvePremiumDecelerate = Cubic(0.16, 1.0, 0.3, 1.0);
}
