import 'package:flutter/material.dart';
import 'package:ondulgram/pages/home_page.dart';
import 'package:ondulgram/pages/login_page.dart';
import 'package:ondulgram/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:ondulgram/services/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GetIt.instance.registerSingleton<FirebaseService>(
    FirebaseService(),
  );
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
      initialRoute: 'home',
      routes: {
        'register': (context) => const RegisterPage(),
        'login': (context) => const LoginPage(),
        'home': (context) => HomePage(),
      },
    );
  }
}
