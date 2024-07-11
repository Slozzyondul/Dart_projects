import 'package:bmi_calculator/widgets/info_card.dart';
import 'package:flutter/cupertino.dart';

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
    return Center(
      child: InfoCard(
        height: _deviceHeight! * 0.25,
        width: _deviceWidth! * 0.75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _statusText('normal'),
            _dateText("11/07/2022"),
            _bmiText("23.8")
          ],
        ),
      ),
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
    return Text(
      _date,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _bmiText(String _bmi) {
    return Text(
      _bmi,
      style: TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
