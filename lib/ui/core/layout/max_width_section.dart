import 'package:flutter/widgets.dart';

import 'window_size.dart';

/// A page section that centers its [child], caps its width at [maxWidth] and
/// applies padding that grows with the window size.
class MaxWidthSection extends StatelessWidget {
  const MaxWidthSection({
    super.key,
    required this.child,
    this.maxWidth = contentMaxWidth,
  });

  static const contentMaxWidth = 1100.0;

  /// Comfortable line length for long-form text.
  static const readingMaxWidth = 720.0;

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final (horizontal, vertical) = switch (WindowSize.of(context)) {
      WindowSize.compact => (16.0, 32.0),
      WindowSize.medium => (24.0, 48.0),
      WindowSize.expanded => (32.0, 56.0),
    };

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth + horizontal * 2),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontal,
            vertical: vertical,
          ),
          child: child,
        ),
      ),
    );
  }
}
