import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/widgets/fade_slide_in.dart';
import 'widgets/import_card.dart';

class ImportImageScreen extends ConsumerWidget {
  const ImportImageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Import'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.xxl),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FadeSlideIn(
                    child: Column(
                      children: [
                        Text(
                          'Extract Color Palette',
                          style: theme.textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppSizes.sm),
                        Text(
                          'Upload a screenshot, photo, or design asset to begin.',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface
                                .withValues(alpha: 0.6),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSizes.xxxl),
                  FadeSlideIn(
                    delay: const Duration(milliseconds: 80),
                    child: ImportCard(
                      onChooseImage: () {
                        // Will be connected to image picker in Phase 2
                      },
                      onUseCamera: () {
                        // Will be connected to camera in Phase 2
                      },
                    ),
                  ),
                  const SizedBox(height: AppSizes.xxl),
                  FadeSlideIn(
                    delay: const Duration(milliseconds: 140),
                    child: Row(
                      children: [
                        Expanded(
                          child: _TipCard(
                            icon: Icons.auto_awesome_outlined,
                            title: 'Instant Extraction',
                            subtitle:
                                'Colors are analyzed instantly in real time.',
                          ),
                        ),
                        const SizedBox(width: AppSizes.md),
                        Expanded(
                          child: _TipCard(
                            icon: Icons.accessibility_new_outlined,
                            title: 'Contrast Checks',
                            subtitle:
                                'Verify your palette meets WCAG standards.',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TipCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _TipCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: theme.colorScheme.secondary),
          const SizedBox(height: AppSizes.sm),
          Text(title,
              style: theme.textTheme.titleMedium?.copyWith(fontSize: 14)),
          const SizedBox(height: AppSizes.xs),
          Text(
            subtitle,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
