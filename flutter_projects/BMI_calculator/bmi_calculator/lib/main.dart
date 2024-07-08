import 'package:bmi_calculator/pages/main_page.dart';
import 'package:flutter/cupertino.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'IBMI',
      routes: {
        '/': (BuildContext _context) => MainPage(),
      },
      initialRoute: '/',
    );
  }
}

