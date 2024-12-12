// MIT License
//
// Copyright (c) 2024 Simon Lightfoot
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import 'package:database_search_autocomplete/classes/home.dart';
import 'package:database_search_autocomplete/classes/meetupsdatabase.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late Future<MeetupsDatabase> _dbFuture;

  MeetupsDatabase? database;

  @override
  void initState() {
    super.initState();
    _dbFuture = MeetupsDatabase.create().then((db) => database = db);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dbFuture,
      builder: (BuildContext context, AsyncSnapshot<MeetupsDatabase> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(
            database: snapshot.requireData,
          ),
        );
      },
    );
  }
}

