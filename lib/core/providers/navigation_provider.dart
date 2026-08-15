import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Enum representing the core screens accessible from the Shell navigation.
enum ShellTab {
  home(icon: Icons.home_outlined, selectedIcon: Icons.home_rounded, label: 'Home'),
  importImage(icon: Icons.add_photo_alternate_outlined, selectedIcon: Icons.add_photo_alternate_rounded, label: 'Import'),
  palette(icon: Icons.palette_outlined, selectedIcon: Icons.palette_rounded, label: 'Palette'),
  paletteLab(icon: Icons.science_outlined, selectedIcon: Icons.science_rounded, label: 'Lab'),
  export(icon: Icons.ios_share_outlined, selectedIcon: Icons.ios_share_rounded, label: 'Export');

  final IconData icon;
  final IconData selectedIcon;
  final String label;

  const ShellTab({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
}

/// Manages the currently active shell navigation tab.
class NavigationNotifier extends Notifier<ShellTab> {
  @override
  ShellTab build() => ShellTab.home;

  void selectTab(ShellTab tab) {
    state = tab;
  }

  void selectIndex(int index) {
    if (index >= 0 && index < ShellTab.values.length) {
      state = ShellTab.values[index];
    }
  }
}

final navigationProvider =
    NotifierProvider<NavigationNotifier, ShellTab>(NavigationNotifier.new);
