import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/link.dart';

import '../../../config/app_links.dart';
import '../layout/window_size.dart';

/// App Store and Google Play download badges.
///
/// Badges keep their own aspect ratio at a fixed height and wrap onto a second
/// line when the row does not fit.
class StoreBadges extends StatelessWidget {
  const StoreBadges({super.key});

  @override
  Widget build(BuildContext context) {
    final height = WindowSize.of(context).isCompact ? 52.0 : 60.0;

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 16,
      runSpacing: 16,
      children: [
        _StoreBadge(
          uri: AppLinks.appStore,
          label: 'Download on the App Store',
          child: SvgPicture.asset(
            'assets/images/app_store_badge.svg',
            height: height,
          ),
        ),
        _StoreBadge(
          uri: AppLinks.googlePlay,
          label: 'Get it on Google Play',
          child: Image.asset(
            'assets/images/google_play_badge.png',
            height: height,
          ),
        ),
      ],
    );
  }
}

class _StoreBadge extends StatelessWidget {
  const _StoreBadge({
    required this.uri,
    required this.label,
    required this.child,
  });

  final Uri uri;
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: uri,
      target: LinkTarget.blank,
      builder: (context, followLink) => Semantics(
        link: true,
        label: label,
        excludeSemantics: true,
        child: InkWell(
          onTap: followLink,
          borderRadius: BorderRadius.circular(10),
          child: child,
        ),
      ),
    );
  }
}
