import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropdownButtonClass extends StatelessWidget {
  List<String> values;
  double width;

  CustomDropdownButtonClass({super.key, required this.values, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      width: width,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(53, 53, 53, 1.0),
      ),
      child: DropdownButton(
        value: values.first,
        onChanged: (_) {},
        items: values.map(
          (e) {
            return DropdownMenuItem<String>(
              value: e,
              child: Text(e),
            );
          },
        ).toList(),
        underline: Container(),
        dropdownColor: const Color.fromRGBO(
          53,
          53,
          53,
          1.0,
        ),
        borderRadius: BorderRadius.circular(
          20,
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
