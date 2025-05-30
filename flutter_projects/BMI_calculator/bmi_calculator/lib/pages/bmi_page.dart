import 'package:bmi_calculator/utils/calculator.dart';
import 'package:bmi_calculator/widgets/info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;

class BMIPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BMIPageState();
  }
}

class _BMIPageState extends State<BMIPage> {
  double? _deviceHeight, _deviceWidth;
  int _age = 27, _weight = 160, _height = 70, _gender = 0;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Center(
      child: CupertinoPageScaffold(
        child: Container(
          height: _deviceHeight! * 0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _ageSelectContainer(),
                  _weightSelectorContainer(),
                ],
              ),
              _heightSelectContainer(),
              _genderSelectContainer(),
              _calculateBMIButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ageSelectContainer() {
    return InfoCard(
      height: _deviceHeight! * 0.2,
      width: _deviceWidth! * 0.45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'age yrs',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            _age.toString(),
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                  key: Key('age_minus'),
                  onPressed: () {
                    setState(
                      () {
                        _age--;
                      },
                    );
                  },
                  child: Text('-'),
                  textStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                  key: Key('age_plus'),
                  onPressed: () {
                    setState(
                      () {
                        _age++;
                      },
                    );
                  },
                  child: Text('+'),
                  textStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _weightSelectorContainer() {
    return InfoCard(
      height: _deviceHeight! * 0.2,
      width: _deviceWidth! * 0.45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'weight lbs',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            _weight.toString(),
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                  key: Key('weight_minus'),
                  onPressed: () {
                    setState(
                      () {
                        _weight--;
                      },
                    );
                  },
                  child: Text('-'),
                  textStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                  key: Key('weight_plus'),
                  onPressed: () {
                    setState(
                      () {
                        _weight++;
                      },
                    );
                  },
                  child: Text('+'),
                  textStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _heightSelectContainer() {
    return InfoCard(
      height: _deviceHeight! * 0.18,
      width: _deviceWidth! * 0.9,
      child: Column(
        children: [
          Text(
            'height inches',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            _height.toString(),
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            width: _deviceWidth! * 0.8,
            child: CupertinoSlider(
                min: 0,
                max: 100,
                divisions: 100,
                value: _height.toDouble(),
                onChanged: (_value) {
                  setState(() {
                    _height = _value.toInt();
                  });
                }),
          ),
        ],
      ),
    );
  }

  Widget _genderSelectContainer() {
    return InfoCard(
      height: _deviceHeight! * 0.11,
      width: _deviceWidth! * 0.90,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'gender',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          CupertinoSlidingSegmentedControl(
              groupValue: _gender,
              children: const {
                0: Text("male"),
                1: Text("female"),
              },
              onValueChanged: (_value) {
                setState(() {
                  _gender = _value as int;
                });
              }),
        ],
      ),
    );
  }

  Widget _calculateBMIButton() {
    return Container(
      height: _deviceHeight! * 0.07,
      child: CupertinoButton.filled(
        child: const Text(
          "calculate bmi",
        ),
        onPressed: () {
          if (_height > 0 && _weight > 0 && _age > 0) {
            double _bmi = calculateBMI(_height, _weight);
            _showResultDialog(_bmi);
            //print(_bmi);
          }
        },
      ),
    );
  }

  void _showResultDialog(double _bmi) {
    String? _status;
    if (_bmi < 18.5) {
      _status = "Underweight";
    } else if (_bmi >= 18.5 && _bmi < 25) {
      _status = "Normal";
    } else if (_bmi >= 25 && _bmi < 30) {
      _status = "Overweight";
    } else {
      _status = "Obese";
    }
    showCupertinoDialog(
      context: context,
      builder: (BuildContext _context) {
        return CupertinoAlertDialog(
          title: Text(_status!),
          content: Text(
            _bmi.toStringAsFixed(2),
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text('ok'),
              onPressed: () {
                _saveResult(_bmi.toString(), _status!);
                Navigator.pop(_context);
              },
            ),
          ],
        );
      },
    );
  }

  void _saveResult(String _bmi, String _status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'bmi_date',
      DateTime.now().toString(),
    );
    String bmiData = '$_bmi,$_status';
    await prefs.setString(
      'bmi_data',
      bmiData,
    );
    developer.log("\x1B[32mBMI result saved\x1B[0m");
    //print('bmi result saved');
  }
}
