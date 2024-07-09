import 'package:bmi_calculator/widgets/info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BMIPageState();
  }
}

class _BMIPageState extends State<BMIPage> {
  double? _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      child: Container(
        color: Colors.black,
        child: Center(
          child: InfoCard(
            height: _deviceHeight! * 0.2,
            width: _deviceWidth! * 0.45,
            child: Container(),
          ),
        ),
      ),
    );
  }
}
