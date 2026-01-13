import 'package:devotional/src/app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(const MyApp());
}
