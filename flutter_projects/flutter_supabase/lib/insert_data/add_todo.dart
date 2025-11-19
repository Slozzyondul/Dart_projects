import 'package:flutter/material.dart';
import 'package:flutter_supabase/main.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Todo'), centerTitle: true),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'Enter Todo Name'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(hintText: 'Enter Todo Description'),
            ),
            SizedBox(height: 8),
            ElevatedButton(onPressed: () async {
              await supabase.from('Todo').insert({
                'title': _titleController.text,
                'description': _descriptionController.text
              });
            }, child: Text('Add Todo')),
          ],
        ),
      ),
    );
  }
}
