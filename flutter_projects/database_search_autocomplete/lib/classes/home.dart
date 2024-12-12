import 'package:database_search_autocomplete/classes/meetupsdatabase.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
    required this.database,
  });

  final MeetupsDatabase database;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: database.entries.length,
        itemBuilder: (BuildContext context, int index) {
          final entry = database.entries[index];
          return ListTile(
            onTap: (){
              print('Open ${entry.link}');
            },
            title: Text(entry.name),
            subtitle: Text(entry.location),
          );
        },
      ),
    );
  }
}