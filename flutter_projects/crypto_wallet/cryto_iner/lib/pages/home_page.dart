// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:cryto_iner/pages/details_page.dart';
import 'package:cryto_iner/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double? _deviceHeight, _deviceWidth; //设备高度和宽度 or Device height and width
  String? _selectedCoin = "bitcoin";

  HTTPService? _http;
  @override
  void initState() {
    super.initState();
    _http = GetIt.instance.get<HTTPService>();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              _selectedCoinDropdown(),
              _dataWidgets(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectedCoinDropdown() {
    List<String> _coins = [
      "bitcoin",
      "ethereum",
      "tether",
      "cardano",
      "ripple",
    ];
    List<DropdownMenuItem<String>> _items = _coins
        .map((e) => DropdownMenuItem(
              value: e,
              child: Text(
                e,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ))
        .toList();

    return DropdownButton(
      value: _selectedCoin,
      items: _items,
      onChanged: (_value) {
        setState(
          () {
            _selectedCoin = _value;
          },
        );
      },
      dropdownColor: const Color.fromRGBO(255, 255, 255, 1.0),
      iconSize: 30,
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black,
      ),
      underline: Container(),
    );
  }

  //data widget function for acessing data from the cypto API
  Widget _dataWidgets() {
    return FutureBuilder(
      future: _http!.get("/coins/$_selectedCoin"),
      builder: (BuildContext _context, AsyncSnapshot _snapshot) {
        if (_snapshot.hasData) {
          Map _data = jsonDecode(
            _snapshot.data.toString(),
          );
          num _usdPrice = _data["market_data"]["current_price"]["usd"];
          num _change24h = _data["market_data"]["price_change_percentage_24h"];
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onDoubleTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext _context) {
                        return DetailsPage();
                      },
                    ),
                  );
                },
                child: _coinImageWidget(
                  _data["image"]["large"],
                ),
              ),
              _currentPriceWidget(_usdPrice),
              _percentageChangeWidget(_change24h),
              _descriptionCardWidget(
                _data["description"]["en"],
              )
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }
      },
    );
  }

  Widget _currentPriceWidget(num _rate) {
    return Text(
      "${_rate.toStringAsFixed(2)} USD",
      style: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _percentageChangeWidget(num _change) {
    return Text(
      "${_change.toString()} %",
      style: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _coinImageWidget(String _imgURL) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: _deviceHeight! * 0.02,
      ),
      height: _deviceHeight! * 0.15,
      width: _deviceWidth! * 0.15,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(_imgURL),
        ),
      ),
    );
  }

  Widget _descriptionCardWidget(String _description) {
    return Container(
      height: _deviceHeight! * 0.45,
      width: _deviceWidth! * 0.90,
      margin: EdgeInsets.symmetric(
        vertical: _deviceHeight! * 0.05,
      ),
      padding: EdgeInsets.symmetric(
        vertical: _deviceHeight! * 0.01,
        horizontal: _deviceWidth! * 0.01,
      ),
      color: const Color.fromRGBO(255, 255, 255, 0.5),
      child: Text(
        _description,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
