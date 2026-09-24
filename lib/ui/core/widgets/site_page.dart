import 'package:material_ui/material_ui.dart';

import '../theme/app_theme.dart';
import 'site_footer.dart';

/// Shared page shell: sets the browser tab title, makes all text selectable,
/// scrolls the content and appends the site footer.
class SitePage extends StatelessWidget {
  const SitePage({super.key, required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Title(
      title: title,
      color: AppColors.primary,
      child: Scaffold(
        body: SelectionArea(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(children: [...children, const SiteFooter()]),
            ),
          ),
        ),
      ),
    );
  }
}
