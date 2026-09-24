import 'package:material_ui/material_ui.dart';

import '../../../../core/layout/max_width_section.dart';
import '../../../../core/layout/responsive_grid.dart';
import '../../../../core/widgets/section_heading.dart';

const _methods = [
  (
    icon: Icons.psychology,
    title: 'Major System',
    description:
        'Convert numbers into consonant sounds, then create memorable word '
        'associations.',
  ),
  (
    icon: Icons.groups,
    title: 'PAO Method',
    description:
        'Person-Action-Object system for remembering long sequences with '
        'vivid mental stories.',
  ),
  (
    icon: Icons.fitness_center,
    title: 'Daily Practice',
    description:
        'Build your memory muscle with guided exercises and track your '
        'progress over time.',
  ),
];

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MaxWidthSection(
      child: Column(
        spacing: 40,
        children: [
          const SectionHeading('How It Works'),
          ResponsiveGrid(
            // Three cards side by side, or a single column; two columns would
            // leave the third card on its own.
            columnsForWidth: (width) => width >= 720 ? 3 : 1,
            children: [
              for (final method in _methods)
                _MethodCard(
                  icon: method.icon,
                  title: method.title,
                  description: method.description,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MethodCard extends StatelessWidget {
  const _MethodCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          spacing: 16,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: colorScheme.onPrimary, size: 32),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge,
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
