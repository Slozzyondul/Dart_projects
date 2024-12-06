// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double _buttonRadius = 100;

  final Tween<double> _backgroundScale = Tween<double>(begin: 0.0, end: 1.0);

  AnimationController? _starIconAnimationController;

  @override
  void initState() {
    super.initState();
    _starIconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    );
    _starIconAnimationController!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _pageBackgroud(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _circularAnimationButton(),
                _starIcon(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _pageBackgroud() {
    return TweenAnimationBuilder(
      tween: _backgroundScale,
      curve: Curves.easeInOutCubicEmphasized,
      duration: const Duration(seconds: 1),
      builder: (_context, double _scale, _child) {
        return Transform.scale(
          scale: _scale,
          child: _child,
        );
      },
      child: Container(
        color: Colors.yellow,
      ),
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

  Widget _starIcon() {
    return AnimatedBuilder(
      animation: _starIconAnimationController!.view,
      builder: (_buildContext, _child) {
        return Transform.rotate(
          angle: _starIconAnimationController!.value *
              2 *
              pi, //converting from radians to degrees
          child: _child,
        );
      },
      child: const Icon(
        Icons.star,
        size: 200,
        color: Colors.black,
      ),
    );
  }
}
