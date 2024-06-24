// ignore_for_file: prefer_const_constructors, use_super_parameters
import 'package:flutter/material.dart';
import './pages/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  //constructor for the class app
  const App({Key? key}) : super(key: key); //key is optional
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticket Book',
      theme: ThemeData(scaffoldBackgroundColor: Color.fromRGBO(31, 31, 31, 1.0),),
      home: HomePage(), 
    );
  }
}