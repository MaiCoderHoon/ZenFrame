import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/providers/navigation_provider.dart';
import '../../home/presentation/home_screen.dart';
import '../../import_image/presentation/import_image_screen.dart';
import '../../palette/presentation/palette_screen.dart';
import '../../palette_lab/presentation/palette_lab_screen.dart';
import '../../export/presentation/export_screen.dart';

/// A responsive shell widget that wraps the application's primary screens.
/// Switches between a BottomNavigationBar on mobile and a NavigationRail
/// on desktop/tablet.
class MainShell extends ConsumerWidget {
  const MainShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTab = ref.watch(navigationProvider);
    final notifier = ref.read(navigationProvider.notifier);
    final theme = Theme.of(context);

    final Widget body = switch (activeTab) {
      ShellTab.home => const HomeScreen(),
      ShellTab.importImage => const ImportImageScreen(),
      ShellTab.palette => const PaletteScreen(),
      ShellTab.paletteLab => const PaletteLabScreen(),
      ShellTab.export => const ExportScreen(),
    };

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= AppSizes.tabletBreakpoint;

        if (isWide) {
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  extended: constraints.maxWidth >= AppSizes.desktopBreakpoint,
                  selectedIndex: activeTab.index,
                  onDestinationSelected: notifier.selectIndex,
                  labelType: constraints.maxWidth >= AppSizes.desktopBreakpoint
                      ? NavigationRailLabelType.none
                      : NavigationRailLabelType.all,
                  leading: Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSizes.xl),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius:
                            BorderRadius.circular(AppSizes.radiusMd),
                      ),
                      child: const Icon(
                        Icons.palette,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  destinations: ShellTab.values.map((tab) {
                    return NavigationRailDestination(
                      icon: Icon(tab.icon),
                      selectedIcon: Icon(tab.selectedIcon),
                      label: Text(tab.label),
                    );
                  }).toList(),
                ),
                const VerticalDivider(width: 1),
                Expanded(child: body),
              ],
            ),
          );
        }

        return Scaffold(
          body: body,
          bottomNavigationBar: NavigationBar(
            selectedIndex: activeTab.index,
            onDestinationSelected: notifier.selectIndex,
            destinations: ShellTab.values.map((tab) {
              return NavigationDestination(
                icon: Icon(tab.icon),
                selectedIcon: Icon(tab.selectedIcon),
                label: tab.label,
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
