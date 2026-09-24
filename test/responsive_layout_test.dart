import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers.dart';

void main() {
  group('renders without layout overflow', () {
    for (final MapEntry(key: name, value: size) in allSizes.entries) {
      for (final location in ['/', '/privacy', '/missing']) {
        testWidgets('$location at $name (${size.width.toInt()}px)', (
          tester,
        ) async {
          await pumpApp(tester, location: location, size: size);

          expect(tester.takeException(), isNull);
        });
      }
    }
  });

  group('How It Works cards', () {
    testWidgets('sit in one row on wide windows', (tester) async {
      await pumpApp(tester, size: expandedSize);

      final major = tester.getTopLeft(find.text('Major System'));
      final pao = tester.getTopLeft(find.text('PAO Method'));
      expect(pao.dy, major.dy);
      expect(pao.dx, greaterThan(major.dx));
    });

    testWidgets('stack in one column on phones', (tester) async {
      await pumpApp(tester, size: compactSize);

      final major = tester.getTopLeft(find.text('Major System'));
      final pao = tester.getTopLeft(find.text('PAO Method'));
      expect(pao.dy, greaterThan(major.dy));
    });
  });

  group('screenshots', () {
    testWidgets('show side by side on wide windows', (tester) async {
      await pumpApp(tester, size: expandedSize);

      expect(_horizontalLists(), findsNothing);
    });

    testWidgets('become a horizontal carousel on phones', (tester) async {
      await pumpApp(tester, size: compactSize);

      expect(_horizontalLists(), findsOneWidget);
    });
  });

  testWidgets('store badges wrap onto two lines on phones', (tester) async {
    await pumpApp(tester, size: compactSize);

    final appStore = tester.getTopLeft(
      find.bySemanticsLabel('Download on the App Store').first,
    );
    final googlePlay = tester.getTopLeft(
      find.bySemanticsLabel('Get it on Google Play').first,
    );
    expect(googlePlay.dy, greaterThan(appStore.dy));
  });
}

Finder _horizontalLists() => find.byWidgetPredicate(
  (widget) => widget is ListView && widget.scrollDirection == Axis.horizontal,
);
