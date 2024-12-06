import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:prototype2/models/get_all_transactions.dart';

Future<List<Transaction>> fetchTransactions() async {
  final response =
      await http.get(Uri.parse('http://192.168.43.88:5000/transactions'));
  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((json) => Transaction.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load transactions');
  }
}
