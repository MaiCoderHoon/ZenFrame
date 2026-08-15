import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/widgets/color_swatch.dart';
import '../../../../core/widgets/pressable_scale.dart';
import '../../../../models/palette_model.dart';

/// A reusable palette card component that displays a palette's name,
/// metadata, color swatches, and action controls.
class PaletteCard extends StatelessWidget {
  final PaletteModel palette;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onMenuAction;

  const PaletteCard({
    super.key,
    required this.palette,
    this.onTap,
    this.onFavoriteToggle,
    this.onMenuAction,
  });

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return '${date.month}/${date.day}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PressableScale(
      onTap: onTap,
      child: Container(
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
            // Color strip at top — spans full width
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSizes.radiusLg),
                topRight: Radius.circular(AppSizes.radiusLg),
              ),
              child: SizedBox(
                height: 48,
                child: Row(
                  children: palette.colors.map((c) {
                    return Expanded(
                      child: Container(color: c),
                    );
                  }).toList(),
                ),
              ),
            ),

            // Card body
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.lg,
                AppSizes.md,
                AppSizes.md,
                AppSizes.md,
              ),
              child: Row(
                children: [
                  // Palette info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          palette.name,
                          style: theme.textTheme.titleMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Text(
                              _formatDate(palette.createdAt),
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurface
                                    .withValues(alpha: 0.5),
                              ),
                            ),
                            if (palette.tag != null) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppSizes.sm),
                                child: Text(
                                  '·',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withValues(alpha: 0.3),
                                  ),
                                ),
                              ),
                              Text(
                                palette.tag!,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurface
                                      .withValues(alpha: 0.5),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Action row
                  if (onFavoriteToggle != null)
                    IconButton(
                      onPressed: onFavoriteToggle,
                      icon: Icon(
                        palette.isFavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_outline_rounded,
                        size: 18,
                        color: palette.isFavorite
                            ? theme.colorScheme.error
                            : theme.colorScheme.onSurface
                                .withValues(alpha: 0.4),
                      ),
                      tooltip:
                          palette.isFavorite ? 'Unfavorite' : 'Favorite',
                      visualDensity: VisualDensity.compact,
                    ),
                  if (onMenuAction != null)
                    IconButton(
                      onPressed: onMenuAction,
                      icon: Icon(
                        Icons.more_horiz_rounded,
                        size: 18,
                        color: theme.colorScheme.onSurface
                            .withValues(alpha: 0.4),
                      ),
                      tooltip: 'More options',
                      visualDensity: VisualDensity.compact,
                    ),
                ],
              ),
            ),

            // Swatch row
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.lg,
                0,
                AppSizes.lg,
                AppSizes.md,
              ),
              child: Row(
                children: palette.colors.map((c) {
                  return Padding(
                    padding: const EdgeInsets.only(right: AppSizes.xs),
                    child: ColorSwatchWidget(
                      color: c,
                      size: SwatchSize.compact,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
