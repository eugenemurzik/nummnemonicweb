import 'package:flutter_test/flutter_test.dart';
import 'package:nummnemonicweb/config/app_links.dart';
import 'package:nummnemonicweb/ui/features/home/views/home_screen.dart';
import 'package:nummnemonicweb/ui/features/not_found/views/not_found_screen.dart';
import 'package:nummnemonicweb/ui/features/privacy/views/privacy_screen.dart';
import 'package:url_launcher/link.dart';

import 'helpers.dart';

void main() {
  testWidgets('/ shows the home page', (tester) async {
    await pumpApp(tester);

    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.text('Remember Numbers Instantly'), findsOneWidget);
  });

  testWidgets('/privacy shows the privacy policy', (tester) async {
    await pumpApp(tester, location: '/privacy');

    expect(find.byType(PrivacyScreen), findsOneWidget);
    expect(find.text('Privacy Policy for Nummnemonic'), findsOneWidget);
  });

  testWidgets('legacy /HomePage redirects to the home page', (tester) async {
    await pumpApp(tester, location: '/HomePage');

    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('unknown paths show the not found page', (tester) async {
    await pumpApp(tester, location: '/does-not-exist');

    expect(find.byType(NotFoundScreen), findsOneWidget);
    expect(find.byType(HomeScreen), findsNothing);
  });

  // Following a Link to an app route goes through the engine's navigation
  // channel, which flutter_test does not deliver, so this checks the target
  // instead of tapping.
  testWidgets('footer links point at app routes and support email', (
    tester,
  ) async {
    await pumpApp(tester);

    Uri? linkTarget(String label) => tester
        .widget<Link>(
          find.ancestor(of: find.text(label), matching: find.byType(Link)),
        )
        .uri;

    expect(linkTarget('Home'), Uri.parse('/'));
    expect(linkTarget('Privacy Policy'), Uri.parse('/privacy'));
    expect(linkTarget('nummnemonic@proton.me'), AppLinks.supportEmailUri);
  });
}
