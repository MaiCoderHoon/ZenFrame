import 'package:flutter/material.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_typography.dart';

class ExportScreen extends StatefulWidget {
  const ExportScreen({super.key});

  @override
  State<ExportScreen> createState() => _ExportScreenState();
}

class _ExportScreenState extends State<ExportScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final Map<String, String> _codeSnippets = {
    'Flutter': '''
class AppTheme {
  static const Color primary = Color(0xFF4F46E5);
  static const Color secondary = Color(0xFF8B5CF6);
  static const Color tertiary = Color(0xFF06B6D4);
  static const Color accent = Color(0xFFF59E0B);
  static const Color background = Color(0xFFF9FAFB);
}''',
    'Tailwind': '''
module.exports = {
  theme: {
    extend: {
      colors: {
        brand: {
          primary: '#4f46e5',
          secondary: '#8b5cf6',
          tertiary: '#06b6d4',
          accent: '#f59e0b',
          neutral: '#f9fafb',
        }
      }
    }
  }
}''',
    'CSS': ''':root {
  --color-primary: #4f46e5;
  --color-secondary: #8b5cf6;
  --color-tertiary: #06b6d4;
  --color-accent: #f59e0b;
  --color-background: #f9fafb;
}''',
    'JSON': '''{
  "colors": {
    "primary": "#4f46e5",
    "secondary": "#8b5cf6",
    "tertiary": "#06b6d4",
    "accent": "#f59e0b",
    "background": "#f9fafb"
  }
}''',
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _codeSnippets.length, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tabKeys = _codeSnippets.keys.toList();
    final activeKey = tabKeys[_tabController.index];
    final activeCode = _codeSnippets[activeKey] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Export Palette'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Generate Developer Assets',
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: AppSizes.xs),
              Text(
                'Copy and paste production-ready variables straight into your codebase.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: AppSizes.xl),
              
              // Target Selector TabBar
              Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 4.0,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  labelColor: theme.colorScheme.onSurface,
                  unselectedLabelColor: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  labelStyle: AppTypography.label,
                  tabs: tabKeys.map((name) => Tab(text: name)).toList(),
                ),
              ),
              const SizedBox(height: AppSizes.lg),
              
              // Code Snippet Display Box
              Container(
                padding: const EdgeInsets.all(AppSizes.lg),
                decoration: BoxDecoration(
                  color: theme.brightness == Brightness.dark
                      ? theme.colorScheme.surfaceContainer
                      : theme.colorScheme.surfaceContainer.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                  border: Border.all(color: theme.colorScheme.outline),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$activeKey Snippet',
                          style: (theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600) ?? const TextStyle()),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            // Copy action placeholder
                          },
                          icon: const Icon(Icons.copy_rounded, size: 14),
                          label: const Text('Copy to Clipboard'),
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: AppSizes.lg),
                    SelectableText(
                      activeCode,
                      style: AppTypography.mono.copyWith(
                        color: theme.brightness == Brightness.dark
                            ? theme.colorScheme.onSurface.withValues(alpha: 0.85)
                            : theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
