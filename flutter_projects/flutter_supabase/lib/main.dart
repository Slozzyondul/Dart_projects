import 'package:flutter/material.dart';
import 'package:flutter_supabase/email_password_sign_up/email_password_sign_in.dart';
import 'package:flutter_supabase/insert_data/todo_home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://vfwsqsqdpupdokddybec.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZmd3Nxc3FkcHVwZG9rZGR5YmVjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjMzNjQxNTIsImV4cCI6MjA3ODk0MDE1Mn0.nUnx9aiWECPUl4v0U4--6Aey1_aGz1QuyEPeu6ICB7k",
  );

  runApp(const MyApp());
}
//supabase client global variable
final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const TodoHome(),
    );
  }
}
