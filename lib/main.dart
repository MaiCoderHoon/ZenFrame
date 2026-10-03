// lib/main.dart
//
// ZenFrame entry point.
// Job of this file: initialise services, then hand off to FocusScreen.
// All app state lives in FocusScreen (plain setState, no BLoC).

import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'screens/focus_screen.dart';

// TODO: paste your public SDK keys from the RevenueCat dashboard.
// (Public SDK keys are safe to ship in the app; never put secret keys here.)
const String _revenueCatAndroidKey = 'goog_YOUR_KEY_HERE';
const String _revenueCatIosKey = 'appl_YOUR_KEY_HERE';

Future<void> main() async {
  // Required because we do async work before runApp().
  WidgetsFlutterBinding.ensureInitialized();

  // Portrait only keeps the breathing circle layout simple.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Make the status bar blend into the dark background.
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  await _initRevenueCat();

  runApp(const ZenFrameApp());
}

Future<void> _initRevenueCat() async {
  try {
    await Purchases.setLogLevel(LogLevel.debug);

    final String apiKey = Platform.isAndroid
        ? _revenueCatAndroidKey
        : _revenueCatIosKey;

    await Purchases.configure(PurchasesConfiguration(apiKey));
  } catch (e) {
    // Don't crash the app if purchases fail to initialise (e.g. no network,
    // placeholder key). The timer should still work; Pro features stay locked.
    debugPrint('RevenueCat init failed: $e');
  }
}

class ZenFrameApp extends StatelessWidget {
  const ZenFrameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZenFrame',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0F14),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7FB7BE),
          brightness: Brightness.dark,
        ),
      ),
      home: const FocusScreen(),
    );
  }
}
