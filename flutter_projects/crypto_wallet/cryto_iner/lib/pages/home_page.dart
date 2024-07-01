// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

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
    List<String> _coins = ["bitcoin"];
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
      value: _coins.first,
      items: _items,
      onChanged: (_value) {},
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
      future: _http!.get("/coins/bitcoin"),
      builder: (BuildContext _context, AsyncSnapshot _snapshot) {
        if (_snapshot.hasData) {
          Map _data = jsonDecode(
            _snapshot.data.toString(),
          );
          num _usdPrice = _data["market_data"]["current_price"]["usd"];
          return Text(
            _usdPrice.toString(),
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
}
