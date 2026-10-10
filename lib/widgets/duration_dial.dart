// lib/widgets/duration_dial.dart
//
// Lets the user choose a session length.
// Pure UI: parent passes the current value and a callback for changes
// ("pass data down, pass callbacks up").

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DurationDial extends StatelessWidget {
  final int minutes;
  final ValueChanged<int> onChanged;

  /// Disabled while a session is running.
  final bool enabled;

  const DurationDial({
    super.key,
    required this.minutes,
    required this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1.0 : 0.3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$minutes min',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
              letterSpacing: 1,
            ),
          ),
          Slider(
            value: minutes.toDouble(),
            min: 5,
            max: 60,
            divisions: 11, // steps of 5 minutes: 5, 10, ... 60
            onChanged: enabled
                ? (value) {
                    HapticFeedback.selectionClick(); // gentle tick per step
                    onChanged(value.toInt());
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
