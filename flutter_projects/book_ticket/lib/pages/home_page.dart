// ignore_for_file: unused_element, avoid_unnecessary_containers, must_be_immutable, sized_box_for_whitespace

import 'package:book_ticket/widgets/custom_dropdown_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  late double _deviceHeight, _deviceWidth;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _pageTitle(),
                  _bookRideWidget(),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: _mylogoImageWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageTitle() {
    return const Text(
      "#BookTicket",
      style: TextStyle(
        color: Colors.white,
        fontSize: 70,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _mylogoImageWidget() {
    return Container(
      height: _deviceHeight * 0.50,
      width: _deviceWidth * 0.65,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/mylogo.png"),
        ),
      ),
    );
  }

  Widget _bookRideWidget() {
    return Container(
      height: _deviceHeight * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _destinatonDropDownWidget(),
          _travellersInformationWidget(),
          _rideButton(),
        ],
      ),
    );
  }

  Widget _destinatonDropDownWidget() {
    return CustomDropdownButtonClass(
      values: const [
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
      ],
      width: _deviceWidth,
    );
  }

  Widget _travellersInformationWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomDropdownButtonClass(
          values: const [
            'how many tickets do you need discounts are available',
            '1',
            '2',
            '3',
            '4',
            '5',
            '6',
            '7',
          ],
          width: _deviceWidth * 0.45,
        ),
        CustomDropdownButtonClass(
          values: const [
            'please select your class',
            'economy',
            'business',
            'first',
            'private',
          ],
          width: _deviceWidth * 0.40,
        ),
      ],
    );
  }

  Widget _rideButton() {
    return Container(
      margin: EdgeInsets.only(bottom: _deviceHeight * 0.001),
      width: _deviceHeight,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: MaterialButton(
        onPressed: () {},
        child: const Text(
          "Book Now!",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
