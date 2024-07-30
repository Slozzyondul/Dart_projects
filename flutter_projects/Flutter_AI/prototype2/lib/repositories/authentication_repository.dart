import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:prototype2/models/user.dart';
import '../services/api_service.dart';

class AuthenticationRepository {
  final ApiService apiService;

  AuthenticationRepository({required this.apiService});

  Future<User> login(String username, String password) async {
    // Call API to login
    final user = await apiService.login(username, password);
    // Save user data locally using shared preferences
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', jsonEncode(user.toJson()));
    return user;
  }

  // Other methods like signup, logout...
}
