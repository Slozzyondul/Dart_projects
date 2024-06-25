// ignore_for_file: unused_element, no_leading_underscores_for_local_identifiers, avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  late double _deviceHeight, _deviceWidth;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body:  SafeArea(
        child: Container(
        height: _deviceHeight,
        width: _deviceWidth,
        padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _pageTitle(),
            _destinatonDropDownWidget(),
            
          ],
        ),
      ),
      ), 
    );
  }

  Widget _pageTitle() {
    return const Text("#BookTicket", 
    style: TextStyle(color: Colors.white, 
    fontSize: 70,
    fontWeight: FontWeight.w800, 
    ),
    );
  }

  Widget _mylogoImageWidget() {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/mylogo.png"),
          ),
        ),
      ); 
  }

  Widget _destinatonDropDownWidget() {
    List<String> _items = [
      'please select your destination here',
      'Nairobi',
      'Kakamega',
      'Nakuru',
      'Busia',
      'Mombasa',
      'Eldoret',
      'Lagos',
      'London',
      'Rome',
      'Madrid',
      'Paris',
      'Riga',
      'Stockholm',
      'Vienna',
      'Warsaw',
    ];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
      width: _deviceWidth,
      decoration: const BoxDecoration(color: Color.fromRGBO(53, 53, 53, 1.0),),
      child: DropdownButton(        
        value: _items.first,
        onChanged: (_) {},
        items: _items.map(
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
      borderRadius: BorderRadius.circular(20,),
      style: const TextStyle(color: Colors.white),
        ),
    );
  }
}