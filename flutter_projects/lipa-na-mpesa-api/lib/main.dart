import 'package:flutter/material.dart';
import 'package:lipa_na_mpesa/keys/keys.dart';
import 'package:lipa_na_mpesa/screens/home_screen.dart';
import 'package:mpesa_flutter_plugin/initializer.dart';

void main() {

  MpesaFlutterPlugin.setConsumerKey(kConsumerKey);
  MpesaFlutterPlugin.setConsumerSecret(kConsumerSecret);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lipa na Mpesa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
