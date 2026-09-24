import 'dart:math' as math;

import 'package:flutter/widgets.dart';

/// Lays [children] out in rows of equal-height, equal-width cells.
///
/// The number of columns is chosen by [columnsForWidth] from the width this
/// widget is given, so the grid adapts to its parent rather than the device.
class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    super.key,
    required this.columnsForWidth,
    required this.children,
    this.spacing = 24,
  });

  final int Function(double width) columnsForWidth;
  final List<Widget> children;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = math.max(
          1,
          math.min(columnsForWidth(constraints.maxWidth), children.length),
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: spacing,
          children: [
            for (var start = 0; start < children.length; start += columns)
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: spacing,
                  children: [
                    for (var i = start; i < start + columns; i++)
                      Expanded(
                        child: i < children.length
                            ? children[i]
                            : const SizedBox.shrink(),
                      ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
