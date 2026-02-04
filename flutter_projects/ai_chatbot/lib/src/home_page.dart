import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void askAiModel() async {
    final response = await post(
      Uri.parse('https://api.deepseek.com/v1/chat/completions'),

      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer sk-f0f1ced93f764698a0330aa0dd48990d',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        "model": "deepseek-chat",
        "messages": [
          {"role": "system", "content": "You are a helpful assistant."},
          {"role": "user", "content": textEditingController.text},
        ],
      }),
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final results = jsonData['choices'][0]['message']['content'];
      setState(() {
        results;
      });
    }
  }

  TextEditingController textEditingController = TextEditingController();
  var results = "return from model based on input";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow, elevation: 16),
      body: Column(
        children: [
          Expanded(child: Center(child: Text(results))),
          Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(hintText: 'Enter your message'),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  askAiModel();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
