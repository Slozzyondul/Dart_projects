import 'package:devotional/src/routing/app_router.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.routerConfig,
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      title: 'Lilly Bossek',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Color(0xFFF5F2ED))),
    );
  }
}
