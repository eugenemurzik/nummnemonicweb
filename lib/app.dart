import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'routing/router.dart';
import 'ui/core/theme/app_theme.dart';

class App extends StatefulWidget {
  const App({super.key, this.initialLocation = AppRoutes.home});

  /// The location to open on start-up. On the web the browser URL takes
  /// precedence; this is mainly useful for tests.
  final String initialLocation;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final GoRouter _router = createRouter(
    initialLocation: widget.initialLocation,
  );

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NumMnemonic',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(),
      routerConfig: _router,
    );
  }
}
