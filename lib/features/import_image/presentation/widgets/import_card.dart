import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';

/// A premium import/dropzone card component for selecting images.
/// Reusable across the Home and Import screens.
class ImportCard extends StatelessWidget {
  final VoidCallback? onChooseImage;
  final VoidCallback? onUseCamera;

  const ImportCard({
    super.key,
    this.onChooseImage,
    this.onUseCamera,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.xxxl,
        horizontal: AppSizes.xxl,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Upload icon
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.add_photo_alternate_outlined,
              color: theme.colorScheme.primary,
              size: 28,
            ),
          ),
          const SizedBox(height: AppSizes.xl),
          Text(
            'Drop an image here',
            style: theme.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSizes.sm),
          Text(
            'Upload a screenshot, photo, or design reference',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSizes.xxl),
          // Button row
          Wrap(
            spacing: AppSizes.md,
            runSpacing: AppSizes.md,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: onChooseImage,
                icon: const Icon(Icons.image_outlined, size: 18),
                label: const Text('Choose Image'),
              ),
              OutlinedButton.icon(
                onPressed: onUseCamera,
                icon: const Icon(Icons.camera_alt_outlined, size: 18),
                label: const Text('Use Camera'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
