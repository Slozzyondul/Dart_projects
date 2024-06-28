// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:convert';

import 'package:cryto_iner/models/app_config.dart';
import 'package:cryto_iner/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:cryto_iner/services/http_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadConfig();
  registerHTTPService();
  runApp(const MyApp());
}

Future<void> loadConfig() async {
  String _configContent =
      await rootBundle.loadString("assets/config/main.json");
  Map _configData = jsonDecode(_configContent);
  GetIt.instance.registerSingleton<AppConfig>(
    AppConfig(
      COIN_API_KEY: _configData["COIN_API_KEY"],

    ),
  );
}

void registerHTTPService() {
  GetIt.instance.registerSingleton<HTTPService>(
    HTTPService(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto miner',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: Colors.yellow,
      ),
      home: const HomePage(),
    );
  }
}
