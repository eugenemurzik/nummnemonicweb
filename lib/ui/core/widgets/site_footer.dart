import 'package:material_ui/material_ui.dart';

import '../../../config/app_links.dart';
import '../../../routing/router.dart';
import '../layout/max_width_section.dart';
import 'text_link.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaxWidthSection(
      child: Column(
        spacing: 16,
        children: [
          const Divider(),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 24,
            runSpacing: 8,
            children: [
              Text(
                '© ${DateTime.now().year} NumMnemonic',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              TextLink(label: 'Home', uri: Uri.parse(AppRoutes.home)),
              TextLink(
                label: 'Privacy Policy',
                uri: Uri.parse(AppRoutes.privacy),
              ),
              TextLink(
                label: AppLinks.supportEmail,
                uri: AppLinks.supportEmailUri,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
