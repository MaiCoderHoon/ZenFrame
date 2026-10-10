// lib/services/storage_service.dart
//
// Wraps shared_preferences so the rest of the app never touches it directly.
// All methods are static: call them like `await StorageService.getMinutes()`.

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _minutesKey = 'selected_minutes';
  static const String _soundKey = 'selected_sound';
  static const String _sessionsKey = 'sessions_completed';

  static Future<int> getMinutes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_minutesKey) ?? 25; // default: 25 minutes
  }

  static Future<void> saveMinutes(int minutes) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_minutesKey, minutes);
  }

  static Future<String> getSound() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_soundKey) ?? 'none';
  }

  static Future<void> saveSound(String soundId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_soundKey, soundId);
  }

  static Future<int> getSessionsCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_sessionsKey) ?? 0;
  }

  /// Adds 1 to the saved total and returns the new total.
  static Future<int> incrementSessions() async {
    final prefs = await SharedPreferences.getInstance();
    final newTotal = (prefs.getInt(_sessionsKey) ?? 0) + 1;
    await prefs.setInt(_sessionsKey, newTotal);
    return newTotal;
  }
}
