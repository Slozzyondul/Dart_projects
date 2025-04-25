import 'package:flutter/material.dart';

import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/ui/views/home.view.dart';
import 'package:flutter_starter/ui/views/login.view.dart';
import 'package:flutter_starter/core/services/auth.service.dart';

class Initialize extends StatefulWidget {
  const Initialize({super.key});

  @override
  InitializeState createState() => InitializeState();
}

class InitializeState extends State<Initialize> {
  @override
  void initState() {
    _initialize();
    super.initState();
  }

  Future<void> _initialize() async {
    final user = await locator<AuthService>().checkIfPrevLoggedIn();
    if (mounted) {
      final screen = user == null ? const LoginView() : const HomeView();
      Navigator.pushReplacement(context, _pageRouteBuilder(screen));
    }
  }

  Route _pageRouteBuilder(Widget widget) {
    return PageRouteBuilder(
      transitionsBuilder: (context, ani1, ani2, child) {
        final tween = Tween(begin: 0.0, end: 1.0);
        final opacity = ani1.drive(tween);
        return FadeTransition(opacity: opacity, child: child);
      },
      pageBuilder: (context, animation, secondaryAnimation) => widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Spacer(flex: 5),
          const LinearProgressIndicator(),
          Container(
            padding: EdgeInsets.only(right: 25),
            constraints: const BoxConstraints(maxWidth: 180),
            child: Image.asset("images/wootcot-simplified.png", fit: BoxFit.contain, height: 125),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
