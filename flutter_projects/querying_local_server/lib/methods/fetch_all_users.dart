// fetch_all_users.dart
import 'dart:convert';

import 'package:prototype2/models/get_all_users.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.parse('http://192.168.43.88:5000/users'));
  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((json) => User.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}
