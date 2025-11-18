import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final supabase = Supabase.instance.client;
          await supabase.auth.signInWithOAuth(OAuthProvider.github);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
