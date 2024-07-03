import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final int _maxQuestions = 3;

  List? questions;
  int _currentQuestionCount = 0;

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
      notifyListeners();
      //print(questions);

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

  String getCurrentQuestionText() {
    return questions![_currentQuestionCount]["question"];
  }

  void answerQuestion(String _answer) async {
    bool isCorrect =
        questions![_currentQuestionCount]["correct_answer"] == _answer;
    _currentQuestionCount++;
    //print(isCorrect ? "correct" : "incorrect"); // print correct or incorrect
    showDialog(
      context: context,
      builder: (BuildContext _context) {
        return AlertDialog(
          backgroundColor: isCorrect ? Colors.green : Colors.red,
          title: Icon(
            isCorrect ? Icons.check_circle : Icons.cancel_sharp,
            color: Colors.black,
          ),
        );
      },
    );
    await Future.delayed(
      const Duration(seconds: 1),
    );
    Navigator.pop(context);

    if (_currentQuestionCount == _maxQuestions) {
      endGame();
    } else {
      notifyListeners();
    }
  }

  Future<void> endGame() async {
    showDialog(
      context: context,
      builder: (BuildContext _context) {
        return const AlertDialog(
          backgroundColor: Colors.yellow,
          title: Text(
            "the  end!",
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          content: Text("score: 0/0"),
        );
      },
    );
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
