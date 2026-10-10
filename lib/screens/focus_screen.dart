// lib/screens/focus_screen.dart
//
// The one and only screen. It OWNS all state (plain setState) and
// orchestrates the widgets and services.
//
// The four "screens" from the PRD are four STATES of this one screen:
//   idle -> enteringFlow -> inFocus -> sessionEnd

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/purchase_service.dart';
import '../services/storage_service.dart';
import '../widgets/breathing_circle.dart';
import '../widgets/duration_dial.dart';
import '../widgets/sound_picker.dart';

enum FocusStatus { idle, enteringFlow, inFocus, sessionEnd }

class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  // ---- State (everything the screen needs to remember) ----
  FocusStatus _status = FocusStatus.idle;
  int _selectedMinutes = 25;
  int _secondsLeft = 25 * 60;
  String _selectedSound = 'none';
  bool _isPro = false;
  int _sessionsCompleted = 0;

  Timer? _timer;
  final AudioPlayer _player = AudioPlayer();

  bool get _isFocusing => _status == FocusStatus.inFocus;

  // ---- Lifecycle ----
  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _player.dispose();
    super.dispose();
  }

  Future<void> _loadSavedData() async {
    final minutes = await StorageService.getMinutes();
    final sound = await StorageService.getSound();
    final sessions = await StorageService.getSessionsCompleted();
    final isPro = await PurchaseService.checkEntitlement();

    if (!mounted) return; // screen may be gone after awaiting
    setState(() {
      _selectedMinutes = minutes;
      _secondsLeft = minutes * 60;
      _selectedSound = isPro || sound == 'none' ? sound : 'none';
      _sessionsCompleted = sessions;
      _isPro = isPro;
    });
  }

  // ---- Actions ----
  void _onCircleTap() {
    switch (_status) {
      case FocusStatus.idle:
        _startSession();
        break;
      case FocusStatus.inFocus:
        _endSession(completed: false);
        break;
      case FocusStatus.sessionEnd:
        _reset();
        break;
      case FocusStatus.enteringFlow:
        break; // ignore taps during the short intro
    }
  }

  Future<void> _startSession() async {
    HapticFeedback.mediumImpact();
    setState(() {
      _status = FocusStatus.enteringFlow;
      _secondsLeft = _selectedMinutes * 60;
    });

    // A short pause so the user can settle before the timer starts.
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted || _status != FocusStatus.enteringFlow) return;

    setState(() => _status = FocusStatus.inFocus);
    _startSound();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft <= 1) {
        _endSession(completed: true);
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  Future<void> _endSession({required bool completed}) async {
    _timer?.cancel();
    _player.stop();

    if (completed) {
      HapticFeedback.heavyImpact();
      final total = await StorageService.incrementSessions();
      if (!mounted) return;
      setState(() {
        _sessionsCompleted = total;
        _secondsLeft = 0;
        _status = FocusStatus.sessionEnd;
      });
    } else {
      _reset();
    }
  }

  void _reset() {
    setState(() {
      _status = FocusStatus.idle;
      _secondsLeft = _selectedMinutes * 60;
    });
  }

  void _onMinutesChanged(int minutes) {
    setState(() {
      _selectedMinutes = minutes;
      _secondsLeft = minutes * 60;
    });
    StorageService.saveMinutes(minutes);
  }

  void _onSoundChanged(String soundId) {
    setState(() => _selectedSound = soundId);
    StorageService.saveSound(soundId);
    if (_isFocusing) _startSound();
  }

  Future<void> _onLockedSoundTap() async {
    final bool nowPro = await PurchaseService.showPaywall();
    if (!mounted) return;
    setState(() => _isPro = nowPro);
  }

  Future<void> _startSound() async {
    await _player.stop();
    if (_selectedSound == 'none') return;
    try {
      await _player.setReleaseMode(ReleaseMode.loop);
      await _player.play(AssetSource('sounds/$_selectedSound.mp3'));
    } catch (e) {
      debugPrint('Could not play sound: $e');
    }
  }

  // ---- Helpers ----
  String get _circleLabel {
    switch (_status) {
      case FocusStatus.idle:
        return _formatTime(_secondsLeft);
      case FocusStatus.enteringFlow:
        return 'Breathe';
      case FocusStatus.inFocus:
        return _formatTime(_secondsLeft);
      case FocusStatus.sessionEnd:
        return 'Done';
    }
  }

  String get _hint {
    switch (_status) {
      case FocusStatus.idle:
        return 'Tap the circle to begin';
      case FocusStatus.enteringFlow:
        return 'Settling in...';
      case FocusStatus.inFocus:
        return 'Tap to end early';
      case FocusStatus.sessionEnd:
        return 'Well done. $_sessionsCompleted sessions so far';
    }
  }

  String _formatTime(int totalSeconds) {
    final m = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final s = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  // ---- UI ----
  @override
  Widget build(BuildContext context) {
    final bool controlsEnabled = _status == FocusStatus.idle;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Text(
                'ZenFrame',
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 6,
                  color: Colors.white38,
                ),
              ),
              const Spacer(),
              BreathingCircle(
                isFocusing: _isFocusing || _status == FocusStatus.enteringFlow,
                label: _circleLabel,
                onTap: _onCircleTap,
              ),
              const SizedBox(height: 32),
              Text(
                _hint,
                style: const TextStyle(color: Colors.white54, fontSize: 14),
              ),
              const Spacer(),
              DurationDial(
                minutes: _selectedMinutes,
                onChanged: _onMinutesChanged,
                enabled: controlsEnabled,
              ),
              const SizedBox(height: 16),
              SoundPicker(
                selectedId: _selectedSound,
                isPro: _isPro,
                onChanged: _onSoundChanged,
                onLockedTap: _onLockedSoundTap,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
