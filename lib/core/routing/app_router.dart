import 'package:flutter/material.dart';
import '../../features/shell/presentation/main_shell.dart';
import '../../features/paywall/presentation/paywall_screen.dart';

/// App routing system using Flutter standard imperative named routing.
/// Easy to maintain, clean, and easily expandable.
class AppRouter {
  AppRouter._();

  static const String initial = '/';
  static const String paywall = '/paywall';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
        return MaterialPageRoute(
          builder: (_) => const MainShell(),
          settings: settings,
        );

      case paywall:
        // Use a slide-up transition for the paywall to feel like a premium modal sheet
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const PaywallScreen(),
          transitionsBuilder: (_, animation, __, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeInOutCubic;
            
            final tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve),
            );
            
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          fullscreenDialog: true, // Configures native back swipe behavior
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
