import 'package:flutter/material.dart';

/// Enum representing the core screens accessible from the Shell navigation.
enum ShellTab {
  home(icon: Icons.home_outlined, selectedIcon: Icons.home, label: 'Home'),
  importImage(icon: Icons.add_photo_alternate_outlined, selectedIcon: Icons.add_photo_alternate, label: 'Import'),
  palette(icon: Icons.palette_outlined, selectedIcon: Icons.palette, label: 'Palette'),
  paletteLab(icon: Icons.science_outlined, selectedIcon: Icons.science, label: 'Lab'),
  export(icon: Icons.ios_share_outlined, selectedIcon: Icons.ios_share, label: 'Export');

  final IconData icon;
  final IconData selectedIcon;
  final String label;

  const ShellTab({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
}

/// A notifier that manages which tab is currently selected in the main app shell.
class NavigationNotifier extends ChangeNotifier {
  ShellTab _currentTab = ShellTab.home;

  ShellTab get currentTab => _currentTab;

  int get currentIndex => _currentTab.index;

  void selectTab(ShellTab tab) {
    if (_currentTab != tab) {
      _currentTab = tab;
      notifyListeners();
    }
  }

  void selectIndex(int index) {
    if (index >= 0 && index < ShellTab.values.length) {
      selectTab(ShellTab.values[index]);
    }
  }
}
