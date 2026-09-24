import 'package:go_router/go_router.dart';

import '../ui/features/home/views/home_screen.dart';
import '../ui/features/not_found/views/not_found_screen.dart';
import '../ui/features/privacy/views/privacy_screen.dart';

abstract final class AppRoutes {
  static const home = '/';
  static const privacy = '/privacy';
}

GoRouter createRouter({String initialLocation = AppRoutes.home}) => GoRouter(
  initialLocation: initialLocation,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.privacy,
      builder: (context, state) => const PrivacyScreen(),
    ),
    // Legacy FlutterFlow URL, kept so existing links still resolve.
    GoRoute(path: '/HomePage', redirect: (context, state) => AppRoutes.home),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
