import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_starter/main.dart';
import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/ui/views/login.view.dart';
import 'package:flutter_starter/core/models/auth.model.dart';
import 'package:flutter_starter/core/models/user.model.dart';
import 'package:flutter_starter/core/services/base.service.dart';
import 'package:flutter_starter/core/constants/apis.constant.dart';
import 'package:flutter_starter/core/services/secure_storage.service.dart';

class AuthService extends ChangeNotifier {
  User? _user;

  final Dio _dio = locator<BaseService>().dio;
  final storageService = locator<SecureStorageService>();

  User? get user => _user;

  Future<User?> checkIfPrevLoggedIn() async {
    final auth = await storageService.getAuthData();
    if (auth.accessToken != null) await fetchMyDetails();
    return _user;
  }

  Future<void> login(String email, String password) async {
    final payload = {"email": email, "password": password};
    final response = await _dio.post(apiLogin, data: payload);
    await storageService.storeAuthData(Auth.fromJson(response.data!));
    await fetchMyDetails();
  }

  Future<void> fetchMyDetails() async {
    final response = await _dio.get(apiGetMyDetails);
    _user = User.fromJson(response.data);
    notifyListeners();
  }

  Future<Response> signUp(Map<String, dynamic> payload) async {
    return await _dio.post(apiSignUp, data: payload);
  }

  Future<void> logout() async {
    await resetLazySingletons();
    await storageService.clearAuthData();
    await navigatorKey.currentState!.pushAndRemoveUntil(MaterialPageRoute(builder: (_) => LoginView()), (_) => false);
  }
}
