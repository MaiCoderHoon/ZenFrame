// lib/widgets/sound_picker.dart
//
// Row of ambient sound choices. Locked sounds show a lock icon and,
// when tapped by a free user, ask the parent to open the paywall.
// Pure UI: never talks to services directly.

import 'package:flutter/material.dart';

class SoundOption {
  final String id; // matches file name: assets/sounds/<id>.mp3
  final String label;
  final IconData icon;
  final bool isPro;

  const SoundOption(this.id, this.label, this.icon, {this.isPro = false});
}

const List<SoundOption> kSoundOptions = [
  SoundOption('none', 'Silence', Icons.volume_off_outlined),
  SoundOption('rain', 'Rain', Icons.water_drop_outlined, isPro: true),
  SoundOption('forest', 'Forest', Icons.park_outlined, isPro: true),
  SoundOption('waves', 'Waves', Icons.waves_outlined, isPro: true),
];

class SoundPicker extends StatelessWidget {
  final String selectedId;
  final bool isPro;
  final ValueChanged<String> onChanged;

  /// Called when a free user taps a Pro sound.
  final VoidCallback onLockedTap;

  const SoundPicker({
    super.key,
    required this.selectedId,
    required this.isPro,
    required this.onChanged,
    required this.onLockedTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color accent = Color(0xFF7FB7BE);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: kSoundOptions.map((option) {
        final bool locked = option.isPro && !isPro;
        final bool selected = option.id == selectedId;

        return GestureDetector(
          onTap: () => locked ? onLockedTap() : onChanged(option.id),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? accent : Colors.white24,
                width: selected ? 2 : 1,
              ),
            ),
            child: Icon(
              locked ? Icons.lock_outline : option.icon,
              color: selected ? accent : Colors.white54,
              size: 22,
            ),
          ),
        );
      }).toList(),
    );
  }
}
