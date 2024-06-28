// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double _buttonRadius = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _pageBackgroud(),
            _circularAnimationButton(),
          ],
        ),
      ),
    );
  }

  Widget _pageBackgroud() {
    return Container(
      color: Colors.yellow,
    );
  }

  Widget _circularAnimationButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          print("solo 点击了圆形按钮");
          setState(() {
            _buttonRadius += _buttonRadius == 200
                ? -100
                : 100; //After clicking the button, the radius of the circular button changes
          });
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.bounceInOut,
          height: _buttonRadius,
          width: _buttonRadius,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(_buttonRadius),
          ),
          child: const Center(
            child: Text(
              "simple!",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
 