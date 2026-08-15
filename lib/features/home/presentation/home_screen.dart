import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/providers/navigation_provider.dart';
import '../../../core/providers/palettes_provider.dart';
import '../../../core/providers/theme_provider.dart';
import '../../../core/routing/app_router.dart';
import '../../../core/widgets/fade_slide_in.dart';
import '../../import_image/presentation/widgets/import_card.dart';
import '../../palette/presentation/widgets/palette_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final palettes = ref.watch(palettesProvider);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ── Header ──
            SliverToBoxAdapter(
              child: FadeSlideIn(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSizes.xxl, AppSizes.xl, AppSizes.xxl, 0,
                  ),
                  child: Row(
                    children: [
                      // Left: Brand
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PaletteSnap',
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.5,
                              ),
                            ),
                            Text(
                              'Your color workspace',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurface
                                    .withValues(alpha: 0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Right: Theme toggle
                      IconButton(
                        onPressed: () =>
                            ref.read(themeModeProvider.notifier).toggle(),
                        icon: Icon(
                          isDark
                              ? Icons.light_mode_outlined
                              : Icons.dark_mode_outlined,
                          size: 20,
                        ),
                        tooltip: isDark
                            ? 'Switch to light mode'
                            : 'Switch to dark mode',
                      ),
                      const SizedBox(width: AppSizes.xs),
                      // Pro badge
                      _ProBadge(
                        onTap: () =>
                            Navigator.pushNamed(context, AppRouter.paywall),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ── Hero Section ──
            SliverToBoxAdapter(
              child: FadeSlideIn(
                delay: const Duration(milliseconds: 60),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSizes.xxl, AppSizes.huge, AppSizes.xxl, 0,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 560),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Turn inspiration\ninto color.',
                          style: theme.textTheme.displayLarge?.copyWith(
                            height: 1.1,
                            letterSpacing: -1.0,
                          ),
                        ),
                        const SizedBox(height: AppSizes.lg),
                        Text(
                          'Extract beautiful, production-ready palettes from any image.',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.onSurface
                                .withValues(alpha: 0.6),
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: AppSizes.xxl),
                        // CTAs
                        Wrap(
                          spacing: AppSizes.md,
                          runSpacing: AppSizes.md,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () => ref
                                  .read(navigationProvider.notifier)
                                  .selectTab(ShellTab.importImage),
                              icon: const Icon(Icons.add_rounded, size: 20),
                              label: const Text('Create Palette'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Scroll to recent section
                                Scrollable.ensureVisible(
                                  context,
                                  duration:
                                      const Duration(milliseconds: 400),
                                );
                              },
                              child: const Text('Browse Recent'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // ── Import Card ──
            SliverToBoxAdapter(
              child: FadeSlideIn(
                delay: const Duration(milliseconds: 120),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSizes.xxl, AppSizes.xxxl, AppSizes.xxl, 0,
                  ),
                  child: ImportCard(
                    onChooseImage: () => ref
                        .read(navigationProvider.notifier)
                        .selectTab(ShellTab.importImage),
                    onUseCamera: () => ref
                        .read(navigationProvider.notifier)
                        .selectTab(ShellTab.importImage),
                  ),
                ),
              ),
            ),

            // ── Recent Palettes Header ──
            SliverToBoxAdapter(
              child: FadeSlideIn(
                delay: const Duration(milliseconds: 180),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSizes.xxl, AppSizes.xxxl, AppSizes.xxl, AppSizes.lg,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent palettes',
                        style: theme.textTheme.titleLarge,
                      ),
                      TextButton(
                        onPressed: () => ref
                            .read(navigationProvider.notifier)
                            .selectTab(ShellTab.palette),
                        child: const Text('View all'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ── Recent Palette Cards ──
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.xxl, 0, AppSizes.xxl, AppSizes.huge,
              ),
              sliver: SliverList.separated(
                itemCount: palettes.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: AppSizes.md),
                itemBuilder: (context, index) {
                  final palette = palettes[index];
                  return FadeSlideIn(
                    delay: Duration(milliseconds: 220 + (index * 60)),
                    child: PaletteCard(
                      palette: palette,
                      onTap: () => ref
                          .read(navigationProvider.notifier)
                          .selectTab(ShellTab.palette),
                      onFavoriteToggle: () => ref
                          .read(palettesProvider.notifier)
                          .toggleFavorite(palette.id),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Small Pro badge button used in the header.
class _ProBadge extends StatelessWidget {
  final VoidCallback? onTap;
  const _ProBadge({this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.md,
          vertical: AppSizes.sm,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.primary,
              theme.colorScheme.secondary,
            ],
          ),
          borderRadius: BorderRadius.circular(AppSizes.radiusRound),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star_rounded, size: 14, color: Colors.white),
            const SizedBox(width: 4),
            Text(
              'Pro',
              style: theme.textTheme.labelLarge?.copyWith(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
