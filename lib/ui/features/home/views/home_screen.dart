import 'package:flutter/widgets.dart';

import '../../../core/widgets/site_page.dart';
import 'sections/cta_section.dart';
import 'sections/hero_section.dart';
import 'sections/how_it_works_section.dart';
import 'sections/perfect_for_section.dart';
import 'sections/screenshots_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SitePage(
      title: 'NumMnemonic – Remember Numbers Instantly',
      children: [
        HeroSection(),
        HowItWorksSection(),
        PerfectForSection(),
        ScreenshotsSection(),
        CtaSection(),
      ],
    );
  }
}
