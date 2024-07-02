import 'package:flutter/material.dart';
import 'package:trivia/pages/game_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trivia',
      theme: ThemeData(
        fontFamily: 'ArchitectsDaughter',
        scaffoldBackgroundColor: Colors.yellow,
        primarySwatch: Colors.yellow,
      ),
      home: GamePage(),
    );
  }
}



