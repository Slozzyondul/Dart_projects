import 'package:flutter/material.dart';
import 'package:queryingapi/model/user.dart';
import 'package:queryingapi/services/users_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Center(child: Text('rest api calling')),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final thumbnailUrl = user.picture.thumbnail;
            //final name = user['name']['first'];
            //final email = user.email;
            //final gender = user.gender;
            //final color = user.gender == 'male' ? Colors.yellowAccent : Colors.pinkAccent;
            //final imageUrl = user['picture']['thumbnail'];
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: thumbnailUrl.isNotEmpty
                    ? Image.network(thumbnailUrl)
                    : const Icon(Icons.person),
                // child: Text('${index + 1}'),
              ),
              title: Text(user.name.last),
              subtitle: Text(user.phone),
              //title: Text(gender),
              //tileColor: color,
            );
          },
        ),
        // floatingActionButton: FloatingActionButton(s
        //   onPressed: fetchUsers,
        // ),
      ),
    );
  }

  Future<void> fetchUsers() async {
    try {
      final response = await UsersApi.fetchUsers();
      setState(() {
        users = response;
      });
    } catch (e) {
      print('Error fetching users: $e');
    }
  }
}
