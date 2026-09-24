import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/link.dart';

import '../theme/app_theme.dart';

/// Inline text link.
///
/// Built on [Link], so on the web it renders a real `<a href>`: the browser
/// shows the URL on hover and supports middle-click and "open in new tab".
/// Web URLs open in a new tab; app routes and `mailto:` links open in place.
class TextLink extends StatelessWidget {
  const TextLink({
    super.key,
    required this.label,
    required this.uri,
    this.style,
  });

  final String label;
  final Uri uri;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final isWebUrl = uri.isScheme('http') || uri.isScheme('https');
    final baseStyle = style ?? Theme.of(context).textTheme.bodyMedium;

    return Link(
      uri: uri,
      target: isWebUrl ? LinkTarget.blank : LinkTarget.self,
      builder: (context, followLink) => InkWell(
        onTap: followLink,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
          child: Text(
            label,
            style: baseStyle?.copyWith(
              color: AppColors.link,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.link.withValues(alpha: 0.5),
            ),
          ),
        ),
      ),
    );
  }
}
