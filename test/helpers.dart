import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nummnemonicweb/app.dart';

/// Window widths covering each Material window size class.
const compactSize = Size(360, 800);
const mediumSize = Size(768, 1024);
const expandedSize = Size(1280, 900);

const allSizes = {
  'compact': compactSize,
  'medium': mediumSize,
  'expanded': expandedSize,
};

/// Pumps the whole app at [location] inside a window of [size].
///
/// Layout overflows anywhere on the page fail the test, because the page is a
/// [SingleChildScrollView] that lays out all of its content.
Future<void> pumpApp(
  WidgetTester tester, {
  String location = '/',
  Size size = expandedSize,
}) async {
  tester.view
    ..physicalSize = size
    ..devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(App(initialLocation: location));
  await tester.pumpAndSettle();
}
