import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchImageScreen extends StatefulWidget {
  @override
  _SearchImageScreenState createState() => _SearchImageScreenState();
}

class _SearchImageScreenState extends State<SearchImageScreen> {
  TextEditingController _controller = TextEditingController();
  List<String> _results = [];

  Future<void> _searchImages() async {
    final query = _controller.text;
    final response = await http
        .get(Uri.parse('http://your-backend-url/search?query=$query'));
    final result = jsonDecode(response.body);

    setState(() {
      _results = List<String>.from(result['results']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Images')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Search'),
            ),
            ElevatedButton(
              onPressed: _searchImages,
              child: Text('Search'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _results.length,
                itemBuilder: (context, index) {
                  return Image.network(
                      'http://your-backend-url/uploads/${_results[index]}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
