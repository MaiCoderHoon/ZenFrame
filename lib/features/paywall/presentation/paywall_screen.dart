import 'package:flutter/material.dart';
import '../../../core/constants/app_sizes.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final features = [
      _FeatureItem(Icons.auto_awesome, 'Unlimited AI Generations', 'Use our neural generator to create hundreds of tailored schemes.'),
      _FeatureItem(Icons.wc, 'Accessibility Checks', 'Real-time WCAG AAA contrast analyzer to verify accessibility compliance.'),
      _FeatureItem(Icons.code, 'Developer Export Formats', 'Unlock clean export templates for Tailwind, Flutter, CSS, and JSON.'),
      _FeatureItem(Icons.cloud_sync_outlined, 'Cloud Sync & History', 'Keep your entire inspiration collection safe and synchronized.'),
    ];

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
          tooltip: 'Close',
        ),
        title: const Text('PaletteSnap Pro'),
        actions: [
          TextButton(
            onPressed: () {
              // Restore action placeholder
            },
            child: const Text('Restore'),
          ),
          const SizedBox(width: AppSizes.sm),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.xxl, vertical: AppSizes.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Unlock Complete Creative Control',
                style: theme.textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.sm),
              Text(
                'Unlock advanced AI workflows, compliance analyzers, and custom developer assets.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.xxl),
              
              // Feature list
              ...features.map((f) => Padding(
                padding: const EdgeInsets.only(bottom: AppSizes.lg),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppSizes.sm),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.08),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(f.icon, color: theme.colorScheme.primary, size: 18),
                    ),
                    const SizedBox(width: AppSizes.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(f.title, style: theme.textTheme.titleMedium?.copyWith(fontSize: 14)),
                          const SizedBox(height: 2.0),
                          Text(
                            f.description,
                            style: (theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                            ) ?? const TextStyle()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              
              const SizedBox(height: AppSizes.xl),
              
              // Pricing Cards
              Card(
                child: InkWell(
                  borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.lg),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('Annual Membership', style: theme.textTheme.titleMedium),
                                  const SizedBox(width: AppSizes.sm),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.primary.withValues(alpha: 0.12),
                                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                                    ),
                                    child: Text(
                                      'SAVE 50%',
                                      style: theme.textTheme.labelMedium?.copyWith(
                                        color: theme.colorScheme.primary,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Billed annually at \$29.99/year (\$2.50/month)',
                                style: (theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                                ) ?? const TextStyle()),
                              ),
                            ],
                          ),
                        ),
                        Text('\$29.99', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.sm),
              Card(
                child: InkWell(
                  borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.lg),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Monthly Membership', style: theme.textTheme.titleMedium),
                              const SizedBox(height: 4),
                              Text(
                                'Cancel anytime. Billed monthly.',
                                style: (theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                                ) ?? const TextStyle()),
                              ),
                            ],
                          ),
                        ),
                        Text('\$4.99', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: AppSizes.xxl),
              
              // Purchase Button
              ElevatedButton(
                onPressed: () {
                  // Purchase trigger placeholder
                },
                child: const Text('Start 7-Day Free Trial'),
              ),
              const SizedBox(height: AppSizes.md),
              
              Text(
                'By starting your membership, you agree to our Terms of Use and Privacy Policy. Subscriptions automatically renew unless cancelled at least 24h prior to renewal.',
                style: (theme.textTheme.bodySmall?.copyWith(
                  fontSize: 9.5,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                ) ?? const TextStyle()),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureItem {
  final IconData icon;
  final String title;
  final String description;

  _FeatureItem(this.icon, this.title, this.description);
}
