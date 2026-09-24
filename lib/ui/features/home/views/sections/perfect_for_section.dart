import 'package:material_ui/material_ui.dart';

import '../../../../core/layout/max_width_section.dart';
import '../../../../core/layout/responsive_grid.dart';
import '../../../../core/widgets/section_heading.dart';

const _audiences = [
  (
    icon: Icons.school,
    title: 'Students',
    description:
        'Remember student IDs, locker combinations, and important dates',
  ),
  (
    icon: Icons.business_center,
    title: 'Professionals',
    description:
        'Keep client numbers, access codes, and meeting room numbers at your '
        'fingertips',
  ),
  (
    icon: Icons.emoji_events,
    title: 'Memory Athletes',
    description:
        'Train for competitions with advanced techniques and performance '
        'tracking',
  ),
  (
    icon: Icons.people,
    title: 'Anyone Forgetting Numbers',
    description:
        'Stop writing down phone numbers and PIN codes - remember them '
        'naturally',
  ),
];

class PerfectForSection extends StatelessWidget {
  const PerfectForSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MaxWidthSection(
      child: Column(
        spacing: 40,
        children: [
          const SectionHeading('Perfect For'),
          ResponsiveGrid(
            columnsForWidth: (width) => width >= 640 ? 2 : 1,
            spacing: 16,
            children: [
              for (final audience in _audiences)
                _AudienceCard(
                  icon: audience.icon,
                  title: audience.title,
                  description: audience.description,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AudienceCard extends StatelessWidget {
  const _AudienceCard({
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
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.primary),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          spacing: 16,
          children: [
            Icon(icon, color: colorScheme.primary, size: 40),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(title, style: theme.textTheme.titleMedium),
                  Text(
                    description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
