import 'package:flutter/material.dart';
import '../../../core/constants/app_sizes.dart';

class PaletteScreen extends StatelessWidget {
  const PaletteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Sample extracted palette data for visual preview
    final sampleColors = [
      _SampleColor(name: 'Deep Indigo', hex: '#4F46E5', color: const Color(0xFF4F46E5), weight: '45%'),
      _SampleColor(name: 'Sleek Orchid', hex: '#8B5CF6', color: const Color(0xFF8B5CF6), weight: '25%'),
      _SampleColor(name: 'Neon Teal', hex: '#06B6D4', color: const Color(0xFF06B6D4), weight: '15%'),
      _SampleColor(name: 'Amber Glow', hex: '#F59E0B', color: const Color(0xFFF59E0B), weight: '10%'),
      _SampleColor(name: 'Soft Offwhite', hex: '#F9FAFB', color: const Color(0xFFF9FAFB), weight: '5%'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Palette Inspector'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_outlined),
            tooltip: 'Share',
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_outline),
            tooltip: 'Save Palette',
          ),
          const SizedBox(width: AppSizes.sm),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Active Palette',
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: AppSizes.xs),
              Text(
                'Extracted from your uploaded image. Modify and fine-tune individual colors.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: AppSizes.xl),
              
              // Color Swatches Layout (Vertical list on mobile, grid on desktop is handled dynamically)
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: sampleColors.length,
                separatorBuilder: (_, __) => const SizedBox(height: AppSizes.md),
                itemBuilder: (context, index) {
                  final item = sampleColors[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSizes.md),
                      child: Row(
                        children: [
                          // Color swatch circle
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: item.color,
                              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                              border: Border.all(
                                color: theme.colorScheme.outline.withValues(alpha: 0.5),
                              ),
                            ),
                          ),
                          const SizedBox(width: AppSizes.lg),
                          
                          // Color info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(item.name, style: theme.textTheme.titleMedium),
                                    const SizedBox(width: AppSizes.sm),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: AppSizes.sm,
                                        vertical: 2.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: theme.colorScheme.surfaceContainer,
                                        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                                      ),
                                      child: Text(
                                        item.weight,
                                        style: (theme.textTheme.bodySmall?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ) ?? const TextStyle()),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2.0),
                                Text(
                                  item.hex,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontFamily: 'monospace',
                                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          // Color Actions
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.copy_rounded, size: 20),
                            tooltip: 'Copy HEX',
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.tune_rounded, size: 20),
                            tooltip: 'Adjust Color',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: AppSizes.xxl),
              
              // Accessibility Panel Quick Look
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.accessibility_new, color: theme.colorScheme.primary, size: 20),
                          const SizedBox(width: AppSizes.sm),
                          Text('Contrast & Accessibility', style: theme.textTheme.titleMedium),
                        ],
                      ),
                      const SizedBox(height: AppSizes.sm),
                      Text(
                        'Ensure your text meets WCAG AAA guidelines for readability.',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                      const SizedBox(height: AppSizes.lg),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildContrastTag(context, 'Deep Indigo', 'White', 'AAA Passed', true),
                          _buildContrastTag(context, 'Amber Glow', 'Black', 'AA Passed', true),
                          _buildContrastTag(context, 'Orchid', 'White', 'Fail', false),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContrastTag(BuildContext context, String bg, String fg, String status, bool passed) {
    final theme = Theme.of(context);
    final statusColor = passed ? theme.colorScheme.primary : theme.colorScheme.error;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$fg on $bg', style: (theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500) ?? const TextStyle())),
          const SizedBox(height: 2),
          Text(
            status,
            style: theme.textTheme.labelMedium?.copyWith(
              color: statusColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _SampleColor {
  final String name;
  final String hex;
  final Color color;
  final String weight;

  _SampleColor({
    required this.name,
    required this.hex,
    required this.color,
    required this.weight,
  });
}
