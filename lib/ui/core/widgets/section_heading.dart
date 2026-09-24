import 'package:material_ui/material_ui.dart';

import '../layout/window_size.dart';

/// A centered section title, exposed to assistive technology as a heading.
class SectionHeading extends StatelessWidget {
  const SectionHeading(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Semantics(
      header: true,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: WindowSize.of(context).isCompact
            ? textTheme.headlineMedium
            : textTheme.headlineLarge,
      ),
    );
  }
}
