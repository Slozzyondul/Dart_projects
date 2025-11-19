import 'package:flutter/material.dart';
import 'package:flutter_supabase/insert_data/add_todo.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo Home'), centerTitle: true),
      floatingActionButton: Center(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTodo()),
            );
          },
          shape: CircleBorder(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
