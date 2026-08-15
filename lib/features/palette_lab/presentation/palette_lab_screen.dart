import 'package:flutter/material.dart';
import '../../../core/constants/app_sizes.dart';

class PaletteLabScreen extends StatelessWidget {
  const PaletteLabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    final generationRules = [
      _RuleOption(name: 'Analogous', description: 'Adjacent colors on the color wheel.', icon: Icons.pie_chart_outline),
      _RuleOption(name: 'Monochromatic', description: 'Varying tints, tones, and shades.', icon: Icons.blur_linear),
      _RuleOption(name: 'Complementary', description: 'Opposite sides of the color wheel.', icon: Icons.compare_arrows),
      _RuleOption(name: 'Triadic', description: 'Three evenly spaced colors.', icon: Icons.trip_origin),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Palette Lab'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'AI & Generator Rules',
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: AppSizes.xs),
              Text(
                'Generate fresh palettes using advanced color theory math or AI assistance.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: AppSizes.xl),
              
              // AI Prompt Input Card Placeholder
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.auto_awesome, color: theme.colorScheme.secondary, size: 20),
                          const SizedBox(width: AppSizes.sm),
                          Text('AI Smart Generator', style: theme.textTheme.titleMedium),
                        ],
                      ),
                      const SizedBox(height: AppSizes.md),
                      const TextField(
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: 'e.g. "A cozy retro coffee shop at sunset", "Nordic winter cabin vibe"',
                        ),
                      ),
                      const SizedBox(height: AppSizes.md),
                      ElevatedButton.icon(
                        onPressed: () {
                          // AI Generate action placeholder
                        },
                        icon: const Icon(Icons.bolt),
                        label: const Text('Generate Palette'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.xl),
              
              Text(
                'Color Harmony Rules',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: AppSizes.md),
              
              // Rules Grid/List
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: generationRules.length,
                separatorBuilder: (_, __) => const SizedBox(height: AppSizes.sm),
                itemBuilder: (context, index) {
                  final rule = generationRules[index];
                  return Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(AppSizes.md),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(AppSizes.md),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withValues(alpha: 0.06),
                                borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                              ),
                              child: Icon(rule.icon, color: theme.colorScheme.primary, size: 24),
                            ),
                            const SizedBox(width: AppSizes.lg),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(rule.name, style: theme.textTheme.titleMedium),
                                  const SizedBox(height: 2.0),
                                  Text(
                                    rule.description,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios, size: 14),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RuleOption {
  final String name;
  final String description;
  final IconData icon;

  _RuleOption({
    required this.name,
    required this.description,
    required this.icon,
  });
}
