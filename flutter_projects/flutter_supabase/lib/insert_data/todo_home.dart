import 'package:flutter/material.dart';
import 'package:flutter_supabase/insert_data/add_todo.dart';
import 'package:flutter_supabase/main.dart';

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
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: supabase.from('Todo').select(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snap.hasError) {
            return Center(child: Text('Something went wrong'));
          } else if (snap.hasData && snap.data != null) {
            return ListView.builder(
              itemCount: snap.data?.length ?? 0,
              itemBuilder: (context, index) {
                final todo = snap.data![index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text('${todo['title']}'),
                      subtitle: Text('${todo['description']}'),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: .end,
                          children: [
                            IconButton(
                              onPressed: () async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddTodo(todo: todo),
                                  ),
                                );
 
                                if (result ?? false) {
                                  setState(() {});
                                }
                              },
                              icon: Icon(Icons.edit, color: Colors.blue),
                            ),
                            IconButton(
                              onPressed: () async {
                                await supabase.from('Todo').delete().match({
                                  'id': todo['id'],
                                });
                                setState(() {});
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No data found'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodo()),
          );
        },
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
