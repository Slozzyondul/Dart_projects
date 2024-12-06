import 'package:flutter/material.dart';
import '../models/get_all_users.dart';

class UsersTab extends StatelessWidget {
  final Future<List<User>> users;

  const UsersTab({required this.users, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: users,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No users found.'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var user = snapshot.data![index];
              return ListTile(
                title: Text('User: ${user.user_name}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User ID: ${user.userId}'),
                    Text('Phone: ${user.phoneNumber}'),
                    Text('ID Number: ${user.idNumber}'),
                    Text('Email: ${user.email}'),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
