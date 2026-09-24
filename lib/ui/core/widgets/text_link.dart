import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_theme.dart';

/// Inline text link.
///
/// App routes (URIs without a scheme) navigate with go_router. Other URIs are
/// opened with url_launcher: web URLs in a new tab, and `mailto:` in the
/// current tab so the mail app opens without leaving a blank tab behind.
///
/// This deliberately handles the tap itself instead of using url_launcher's
/// `Link` widget. On the web `Link` only follows a tap when the browser's
/// click also lands on its hidden `<a>` element, which failed in production.
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

  void _open(BuildContext context) {
    if (!uri.hasScheme) {
      context.go(uri.toString());
      return;
    }

    final isWebUrl = uri.isScheme('http') || uri.isScheme('https');
    unawaited(launchUrl(uri, webOnlyWindowName: isWebUrl ? '_blank' : '_self'));
  }

  @override
  Widget build(BuildContext context) {
    final baseStyle = style ?? Theme.of(context).textTheme.bodyMedium;

    return Semantics(
      link: true,
      linkUrl: uri,
      child: InkWell(
        onTap: () => _open(context),
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
