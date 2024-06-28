// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:convert';

import 'package:cryto_iner/models/app_config.dart';
import 'package:cryto_iner/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadConfig();
  runApp(const MyApp());
}

Future<void> loadConfig() async {
  String _configContent =
      await rootBundle.loadString("assets/config/main.json");
  Map _configData = jsonDecode(_configContent);
  GetIt.instance.registerSingleton<AppConfig>(
    AppConfig(
      COIN_API_KEY: _configData["COIN_API_KEY"],
      COIN_API_BASE_URL: _configData["COIN_API_BASE_URL"],
    ),
  );

  print(_configData);
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
