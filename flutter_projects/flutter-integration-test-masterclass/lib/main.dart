import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/initialize.dart';
import 'package:flutter_starter/core/services/auth.service.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tt = theme.textTheme;
    const Color orangeColor = Color(0XFFeb8317);
    const Color darkBlueColor = Color(0XFF10375c);

    return ChangeNotifierProvider.value(
      value: locator<AuthService>(),
      child: MaterialApp(
        title: 'Flutter Integration Test Starter Project',
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: darkBlueColor,
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              letterSpacing: 0.5,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: tt.bodyLarge?.fontSize,
            ),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: orangeColor),
        ),
        home: const Initialize(),
      ),
    );
  }
}
