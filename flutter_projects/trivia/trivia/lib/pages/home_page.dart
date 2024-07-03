// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:trivia/pages/game_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double? _deviceHeight, _deviceWidth;

  double _currentDifficultyLevel = 0;

  final List<String> _difficultyTexts = ["easy", "medium", "hard"];

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.1),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                _appTitle(),
                _difficultySlider(),
                _startGameButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _appTitle() {
    return Column(
      children: [
        const Text(
          "trivial",
          style: TextStyle(
            color: Colors.black,
            fontSize: 50,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          _difficultyTexts[_currentDifficultyLevel.toInt()],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _difficultySlider() {
    return Slider(
      label: "level",
      min: 0,
      max: 2,
      divisions: 2,
      value: _currentDifficultyLevel,
      onChanged: (_value) {
        setState(
          () {
            _currentDifficultyLevel = _value;
            //print(_currentDifficultyLevel);
          },
        );
      },
    );
  }

  Widget _startGameButton() {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (BuildContext _context) {
              return GamePage();
            },
            ),
          );
      },
      color: Colors.black,
      minWidth: _deviceWidth! * 0.8,
      height: _deviceHeight! * 0.15,
      child: const Text(
        "start",
        style: TextStyle(
          color: Colors.yellow,
          fontSize: 25,
        ),
      ),
    );
  }
}
