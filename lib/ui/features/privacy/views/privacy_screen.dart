import 'package:material_ui/material_ui.dart';

import '../../../../config/app_links.dart';
import '../../../core/layout/max_width_section.dart';
import '../../../core/layout/window_size.dart';
import '../../../core/widgets/site_page.dart';
import '../../../core/widgets/store_badges.dart';
import '../../../core/widgets/text_link.dart';
import '../privacy_policy_content.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final secondary = theme.colorScheme.onSurfaceVariant;
    final isCompact = WindowSize.of(context).isCompact;

    return SitePage(
      title: 'Privacy Policy – NumMnemonic',
      children: [
        MaxWidthSection(
          maxWidth: MaxWidthSection.readingMaxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Semantics(
                header: true,
                child: Text(
                  PrivacyPolicyContent.title,
                  style: isCompact
                      ? textTheme.headlineLarge
                      : textTheme.displaySmall,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Last updated: ${PrivacyPolicyContent.lastUpdated}',
                style: textTheme.bodyMedium?.copyWith(color: secondary),
              ),
              const SizedBox(height: 24),
              const _Paragraph(PrivacyPolicyContent.intro),
              for (final section in PrivacyPolicyContent.sections) ...[
                const SizedBox(height: 40),
                Semantics(
                  header: true,
                  child: Text(section.title, style: textTheme.headlineSmall),
                ),
                for (final paragraph in section.paragraphs) ...[
                  const SizedBox(height: 12),
                  _Paragraph(paragraph),
                ],
              ],
            ],
          ),
        ),
        MaxWidthSection(
          child: Column(
            spacing: 16,
            children: [
              const StoreBadges(),
              Text(
                'Free to download. No ads.',
                style: textTheme.bodyMedium?.copyWith(color: secondary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Renders one policy paragraph: a bulleted list when every line starts with
/// `- `, otherwise running text with the support email turned into a link.
class _Paragraph extends StatelessWidget {
  const _Paragraph(this.text);

  final String text;

  static const _bulletPrefix = '- ';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.bodyLarge?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );

    final lines = text.split('\n');
    if (lines.every((line) => line.startsWith(_bulletPrefix))) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          for (final line in lines)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('•  ', style: style),
                Expanded(
                  child: Text(
                    line.substring(_bulletPrefix.length),
                    style: style,
                  ),
                ),
              ],
            ),
        ],
      );
    }

    final parts = text.split(AppLinks.supportEmail);
    return Text.rich(
      TextSpan(
        children: [
          for (var i = 0; i < parts.length; i++) ...[
            if (i > 0)
              WidgetSpan(
                alignment: PlaceholderAlignment.baseline,
                baseline: TextBaseline.alphabetic,
                child: TextLink(
                  label: AppLinks.supportEmail,
                  uri: AppLinks.supportEmailUri,
                  style: style,
                ),
              ),
            TextSpan(text: parts[i]),
          ],
        ],
      ),
      style: style,
    );
  }
}
