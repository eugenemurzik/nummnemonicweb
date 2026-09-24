import 'package:material_ui/material_ui.dart';

import '../../../../core/layout/max_width_section.dart';
import '../../../../core/layout/window_size.dart';
import '../../../../core/widgets/store_badges.dart';

class CtaSection extends StatelessWidget {
  const CtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isCompact = WindowSize.of(context).isCompact;

    return MaxWidthSection(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: colorScheme.primary, width: 2),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isCompact ? 20 : 40,
            vertical: isCompact ? 32 : 48,
          ),
          child: Column(
            children: [
              Semantics(
                header: true,
                child: Text(
                  'Ready to Transform Your Memory?',
                  textAlign: TextAlign.center,
                  style: isCompact
                      ? theme.textTheme.headlineSmall
                      : theme.textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Join thousands who've already improved their number recall",
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 32),
              const StoreBadges(),
            ],
          ),
        ),
      ),
    );
  }
}
