import 'package:material_ui/material_ui.dart';

import '../../../../core/layout/max_width_section.dart';
import '../../../../core/layout/window_size.dart';
import '../../../../core/widgets/store_badges.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final secondary = theme.colorScheme.onSurfaceVariant;

    final headlineStyle = switch (WindowSize.of(context)) {
      WindowSize.compact => textTheme.displaySmall,
      WindowSize.medium => textTheme.displayMedium,
      WindowSize.expanded => textTheme.displayLarge,
    };

    return MaxWidthSection(
      child: Column(
        children: [
          Semantics(
            header: true,
            child: Text(
              'Remember Numbers Instantly',
              textAlign: TextAlign.center,
              style: headlineStyle,
            ),
          ),
          const SizedBox(height: 24),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: MaxWidthSection.readingMaxWidth,
            ),
            child: Text(
              'Turn phone numbers, PIN codes and long digits into memorable '
              'word associations using proven mnemonic systems.',
              textAlign: TextAlign.center,
              style: textTheme.titleLarge?.copyWith(
                color: secondary,
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 32),
          const StoreBadges(),
          const SizedBox(height: 16),
          Text(
            'Free to download. No ads.',
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(color: secondary),
          ),
        ],
      ),
    );
  }
}
