// ignore_for_file: unused_field, avoid_print

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  late double _deviceHeight, _deviceWidth;
  //constructor for the homepage class
  _HomePageState();
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _deviceHeight * 0.15,
        title: const Text(
          "Task Manager",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: _tasksList(),
      floatingActionButton: _addTaskButton(),
    );
  }

  Widget _tasksList() {
    return ListView(
      children: [
        ListTile(
          title: const Text(
            "Code",
            style: TextStyle(decoration: TextDecoration.lineThrough),
          ),
          subtitle: Text(DateTime.now().toString()),
          trailing: const Icon(
            Icons.check_box_outline_blank_outlined,
            color: Colors.black,
          ),
        ),
        ListTile(
          title: const Text(
            "Code again",
            style: TextStyle(decoration: TextDecoration.lineThrough),
          ),
          subtitle: Text(DateTime.now().toString()),
          trailing: const Icon(
            Icons.check_box_outline_blank_outlined,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _addTaskButton() {
    return FloatingActionButton(
      onPressed: () {
        //print("button pressed");
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
