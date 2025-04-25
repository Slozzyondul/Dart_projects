import 'package:flutter/material.dart';

class BottomLinearIndicator extends StatelessWidget {
  const BottomLinearIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(alignment: Alignment.bottomCenter, child: LinearProgressIndicator());
  }
}
