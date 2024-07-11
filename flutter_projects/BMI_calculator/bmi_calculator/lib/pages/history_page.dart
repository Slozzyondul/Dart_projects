import 'package:bmi_calculator/widgets/info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatelessWidget {
  double? _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
      child: _dataCard(),
    );
  }

  Widget _dataCard() {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext _context, AsyncSnapshot _snapshot) {
        if (_snapshot.hasData) {
          final _prefs = _snapshot.data as SharedPreferences;
          final _date = _prefs.getString('bmi_date');
          final _dataString = _prefs.getString('bmi_data');

          if (_date != null && _dataString != null) {
            // Split the string to get the list
            List<String> _data = _dataString.split(',');

            return Center(
              child: InfoCard(
                height: _deviceHeight! * 0.25,
                width: _deviceWidth! * 0.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _statusText(_data[1]),
                    _dateText(_date),
                    _bmiText(_data[0])
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Text('No BMI data found'),
            );
          }
        } else {
          return Center(
            child: CupertinoActivityIndicator(
              color: Colors.yellow,
            ),
          );
        }
      },
    );
  }

  Widget _statusText(String _status) {
    return Text(
      _status,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _dateText(String _date) {
    DateTime _parsedDate = DateTime.parse(_date);
    return Text(
      '${_parsedDate.day} / ${_parsedDate.month} / ${_parsedDate.year}',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _bmiText(String _bmi) {
    return Text(
      double.parse(_bmi).toStringAsFixed(2),
      style: TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
