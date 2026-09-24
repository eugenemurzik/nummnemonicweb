import 'package:flutter/widgets.dart';

/// Material 3 window size classes.
///
/// Use [WindowSize.of] for window-wide decisions such as typography and page
/// padding. For decisions that depend on the space a widget is actually given
/// (column counts, side-by-side vs stacked), use a [LayoutBuilder] and
/// [WindowSize.fromWidth] on its constraints instead.
enum WindowSize {
  compact,
  medium,
  expanded;

  static const mediumMinWidth = 600.0;
  static const expandedMinWidth = 840.0;

  static WindowSize fromWidth(double width) {
    if (width >= expandedMinWidth) return expanded;
    if (width >= mediumMinWidth) return medium;
    return compact;
  }

  static WindowSize of(BuildContext context) =>
      fromWidth(MediaQuery.sizeOf(context).width);

  bool get isCompact => this == compact;
}
