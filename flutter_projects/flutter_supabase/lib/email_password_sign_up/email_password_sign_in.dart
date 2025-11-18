import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EmailPasswordSignIn extends StatefulWidget {
  const EmailPasswordSignIn({super.key});

  @override
  EmailPasswordSignInState createState() => EmailPasswordSignInState();
}

class EmailPasswordSignInState extends State<EmailPasswordSignIn> {
  String uId = '';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(uId)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final res = await Supabase.instance.client.auth.signInWithPassword(
                  email: _emailController.text.trim(),
                  password: _passwordController.text.trim(),
                );
                setState(() {
                  uId = res.user?.id ?? '';
                });
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
