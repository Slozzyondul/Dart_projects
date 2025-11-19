import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_supabase/main.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key, this.todo});
  final Map<String, dynamic>? todo;

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.todo != null) {
      _titleController.text = widget.todo!['title'];
      _descriptionController.text = widget.todo!['description'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.todo != null ? 'Edit Todo' : 'Add Todo'),
        centerTitle: true,
      ),
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
            ElevatedButton(
              onPressed: () async {
                if (widget.todo != null) {
                  try {
                    await supabase
                        .from('Todo')
                        .update({
                          'title': _titleController.text,
                          'description': _descriptionController.text,
                        })
                        .match({'id': widget.todo!['id']});
                    _titleController.clear();
                    _descriptionController.clear();
                    if (context.mounted) {
                      Navigator.pop(context, true);
                    }
                  } catch (e) {
                    if (kDebugMode) {
                      print(e);
                    }
                  }
                } else {
                  try {
                    await supabase.from('Todo').insert({
                      'title': _titleController.text,
                      'description': _descriptionController.text,
                    }).select();
                    _titleController.clear();
                    _descriptionController.clear();
                    if (context.mounted) {
                      Navigator.pop(context, true);
                    }
                  } catch (e) {
                    if (kDebugMode) {
                      print(e);
                    }
                  }
                }
              },
              child: Text(widget.todo != null ? 'Edit Todo' : 'Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}
