// ignore: avoid_web_libraries_in_flutter
import 'package:web/web.dart' as web;

// NOTE:
// Never import this library directly in the application. The UniversalPlatform
// class and library uses conditional imports to only import this file on
// Web platform builds.

final web.Navigator _nav = web.window.navigator;

// UniversalPlatform for Flutter WEB build.
//
// We can use dart:html Navigator to get the current platform.
//
// This function is borrowed, with minor modifications, from GetX utils library with MIT license.
// Credits for it belong to its author Jonny Borges https://github.com/jonataslaw
// https://github.com/jonataslaw/getx/blob/master/lib/get_utils/src/platform/platform_web.dart
//
class UniversalPlatform {
  UniversalPlatform._();
  static bool get web => true;
  // If _nav.appVersion is already a Dart String, .toDart is not needed.
  static bool get macOS => _nav.appVersion.contains('Mac OS') && !iOS;
  static bool get windows => _nav.appVersion.contains('Win');
  static bool get linux =>
      (_nav.appVersion.contains('Linux') || _nav.appVersion.contains('x11')) &&
      !android;
  // Source: https://developer.chrome.com/multidevice/user-agent
  static bool get android => _nav.appVersion.contains('Android ');
  static bool get iOS {
    // maxTouchPoints is needed to separate iPad iOS13 vs new MacOS
    // If _nav.platform is already a Dart String, .toDart is not needed.
    return _hasMatch(_nav.platform, '/iPad|iPhone|iPod/') ||
        (_nav.platform == 'MacIntel' &&
            // If _nav.maxTouchPoints is already a Dart int/num, .toDartInt is not needed.
            _nav.maxTouchPoints > 1);
  }

  // Theoretically we could be in a Web browser on Fuchsia too, but
  // we have no info on how to get that info yet, so we return false.
  static bool get fuchsia => false;
}

bool _hasMatch(String? value, String pattern) {
  // ignore: avoid_bool_literals_in_conditional_expressions
  return value != null && RegExp(pattern).hasMatch(value);
}
