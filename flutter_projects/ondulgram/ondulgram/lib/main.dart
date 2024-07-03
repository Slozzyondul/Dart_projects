import 'package:flutter/material.dart';
import 'package:ondulgram/pages/login_page.dart';
import 'package:ondulgram/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ondulgram',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: 'login',
      routes: {
        'register': (context) => const RegisterPage(),
        'login': (context) => const LoginPage(),
      },
    );
  }
}
