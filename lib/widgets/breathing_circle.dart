// lib/widgets/breathing_circle.dart
//
// The heart of ZenFrame: a softly glowing circle that "breathes".
// Pure UI: it receives everything it needs as constructor parameters.

import 'package:flutter/material.dart';

class BreathingCircle extends StatefulWidget {
  /// When true the circle breathes slowly; when false it rests.
  final bool isFocusing;

  /// Text shown in the middle (e.g. "25:00" or "Tap to begin").
  final String label;

  /// Called when the user taps the circle.
  final VoidCallback onTap;

  const BreathingCircle({
    super.key,
    required this.isFocusing,
    required this.label,
    required this.onTap,
  });

  @override
  State<BreathingCircle> createState() => _BreathingCircleState();
}

class _BreathingCircleState extends State<BreathingCircle>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    // One full "breath in" takes 4 seconds; reverse() is the breath out.
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _scale = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _syncAnimation();
  }

  @override
  void didUpdateWidget(covariant BreathingCircle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isFocusing != widget.isFocusing) {
      _syncAnimation();
    }
  }

  void _syncAnimation() {
    if (widget.isFocusing) {
      _controller.repeat(reverse: true);
    } else {
      _controller.animateTo(0.0, duration: const Duration(milliseconds: 600));
    }
  }

  @override
  void dispose() {
    _controller.dispose(); // always dispose controllers!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color accent = Color(0xFF7FB7BE);

    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _scale,
        builder: (context, child) {
          return Transform.scale(
            scale: _scale.value,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: accent.withOpacity(0.12),
                border: Border.all(color: accent.withOpacity(0.6), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: accent.withOpacity(0.35 * _scale.value),
                    blurRadius: 50,
                    spreadRadius: 8,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: child,
            ),
          );
        },
        child: Text(
          widget.label,
          style: const TextStyle(
            fontSize: 44,
            fontWeight: FontWeight.w200,
            letterSpacing: 2,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
