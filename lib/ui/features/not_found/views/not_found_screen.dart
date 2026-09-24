import 'package:material_ui/material_ui.dart';

import '../../../../routing/router.dart';
import '../../../core/layout/max_width_section.dart';
import '../../../core/widgets/section_heading.dart';
import '../../../core/widgets/site_page.dart';
import '../../../core/widgets/text_link.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SitePage(
      title: 'Page not found – NumMnemonic',
      children: [
        MaxWidthSection(
          maxWidth: MaxWidthSection.readingMaxWidth,
          child: Column(
            spacing: 16,
            children: [
              const SizedBox(height: 48),
              const SectionHeading('Page not found'),
              Text(
                "The page you're looking for doesn't exist or has moved.",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              TextLink(
                label: 'Go to the home page',
                uri: Uri.parse(AppRoutes.home),
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ],
    );
  }
}
