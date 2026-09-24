import 'package:flutter/foundation.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'app.dart';

void main() {
  usePathUrlStrategy();
  runApp(const App());

  // Flutter renders to a canvas, so the page's text is invisible to screen
  // readers and crawlers unless the semantics tree is mirrored into the DOM.
  if (kIsWeb) {
    SemanticsBinding.instance.ensureSemantics();
  }
}
