import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final int _maxQuestions = 10;

  List? questions;

  BuildContext context;

  GamePageProvider({required this.context}) {
    _dio.options.baseUrl = 'https://opentdb.com/api.php';
    _getQuestionFromAPI();
  }

  Future<void> _getQuestionFromAPI() async {
    try {
      var _response = await _dio.get(
        '',
        queryParameters: {
          'amount': _maxQuestions,
          'type': 'boolean',
          'difficulty': 'easy',
        },
      );

      // Directly working with the response data as a Map
      var _data = _response.data as Map<String, dynamic>;

      // Optionally, you can print the data to verify
      //print(_data);

      questions = _data["results"];
      print(questions);

      // Handle the data here
      if (_data['response_code'] == 0) {
        List<dynamic> results = _data['results'];
        // Do something with the results
      } else {
        print('API returned an error response code');
      }
    } catch (e) {
      print('Error fetching data from API: $e');
    }
  }
}
