import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:prototype2/models/get_all_accounts.dart';

Future<List<GetAllAccounts>> fetchAllAcounts() async {
  final response =
      await http.get(Uri.parse('http://192.168.43.88:5000/accounts'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((json) => GetAllAccounts.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load accounts');
  }
}
