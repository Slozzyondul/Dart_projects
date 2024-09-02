import 'dart:convert';
import 'package:http/http.dart' as http; // Import http package
import 'package:queryingapi/model/user.dart';

class UsersApi {
  static Future<List<User>> fetchUsers() async {
    print("fetchUsers initiated");
    const url = 'http://randomuser.me/api/?results=20';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      print("API Response: $json");  // Log the entire API response

      // Check if 'results' is present and is a list
      if (json["results"] != null && json["results"] is List) {
        final results = json["results"] as List<dynamic>;
        
        // Map through the results safely
        final users = results.map((e) {
          return User.fromMap(e as Map<String, dynamic>);
        }).toList();

        return users;
      } else {
        throw Exception("Unexpected API response structure");
      }
    } else {
      throw Exception('Failed to fetch users');
    }
  }
}
