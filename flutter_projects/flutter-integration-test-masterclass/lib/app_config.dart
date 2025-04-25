import 'dart:io';

import 'package:flutter/foundation.dart';

class AppConfig {
  static String get baseUrl {
    const defaultUrl = "http://localhost:9009/api";
    if (kIsWeb) return defaultUrl;
    return Platform.isAndroid ? "http://10.0.2.2:9009/api" : defaultUrl;
  }
}
