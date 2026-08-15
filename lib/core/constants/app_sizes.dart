/// Centralized spacing, layout breakpoints, and corner radii constants.
class AppSizes {
  AppSizes._();

  // Spacing & Padding Scale
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double xxxl = 32.0;
  static const double huge = 48.0;
  static const double massive = 64.0;

  // Corner Radii (Border Radius)
  static const double radiusSm = 4.0;
  static const double radiusMd = 8.0;
  static const double radiusLg = 12.0;
  static const double radiusXl = 16.0;
  static const double radiusXxl = 24.0;
  static const double radiusRound = 999.0;

  // Responsive Breakpoints
  static const double tabletBreakpoint = 600.0;
  static const double desktopBreakpoint = 1024.0;

  // Widget specific dimensions
  static const double sidebarWidth = 240.0;
  static const double navigationRailWidth = 72.0;
  static const double appBarHeight = 56.0;
  static const double buttonHeight = 44.0;
  static const double cardElevation = 0.0; // Flat, sleek style preferred
}
