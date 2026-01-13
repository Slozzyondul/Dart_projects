import 'package:devotional/src/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static RouterConfig<Object>? get routerConfig => GoRouter(
    routes: [GoRoute(path: '/', builder: (context, state) => const HomePage())],
  );
}
