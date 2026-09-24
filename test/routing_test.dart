import 'package:flutter_test/flutter_test.dart';
import 'package:nummnemonicweb/config/app_links.dart';
import 'package:nummnemonicweb/ui/features/home/views/home_screen.dart';
import 'package:nummnemonicweb/ui/features/not_found/views/not_found_screen.dart';
import 'package:nummnemonicweb/ui/features/privacy/views/privacy_screen.dart';
import 'package:nummnemonicweb/ui/core/widgets/text_link.dart';

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

  testWidgets('footer Privacy Policy link opens the privacy policy', (
    tester,
  ) async {
    await pumpApp(tester);

    final privacyLink = find.text('Privacy Policy');
    await tester.ensureVisible(privacyLink);
    await tester.tap(privacyLink);
    await tester.pumpAndSettle();

    expect(find.byType(PrivacyScreen), findsOneWidget);
  });

  testWidgets('footer email link targets the support address', (tester) async {
    await pumpApp(tester);

    final emailLink = tester.widget<TextLink>(
      find.ancestor(
        of: find.text(AppLinks.supportEmail),
        matching: find.byType(TextLink),
      ),
    );
    expect(emailLink.uri, AppLinks.supportEmailUri);
  });
}
