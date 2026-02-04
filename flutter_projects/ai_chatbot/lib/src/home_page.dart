import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow, elevation: 16),
      body: Column(
        children: [
          Expanded(child: Center(child: Text('Results from ai chatbot'))),
          Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Enter your message'),
                  ),
                ),
              ),
              IconButton(icon: Icon(Icons.send), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
