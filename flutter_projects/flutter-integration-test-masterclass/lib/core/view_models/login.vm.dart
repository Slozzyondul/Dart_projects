import 'package:flutter/material.dart';

import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/ui/views/home.view.dart';
import 'package:flutter_starter/core/view_models/base.vm.dart';
import 'package:flutter_starter/core/services/auth.service.dart';
import 'package:flutter_starter/core/utils/regex_validator.dart';

class LoginViewModel extends BaseViewModel {
  String email = "";
  String password = "";

  final formKey = GlobalKey<FormState>();
  final _authService = locator<AuthService>();

  void onEmailChanged(String value) => email = value;
  void onPasswordChanged(String value) => password = value;

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return l10n.thisFieldIsRequired;
    if (!regexEmail.hasMatch(value)) return l10n.invalidEmail;
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return l10n.thisFieldIsRequired;
    return null;
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    try {
      setIsLoading(true);
      await _authService.login(email, password);
      if (context.mounted) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeView()));
      }
    } catch (error) {
      displayApiError(error);
    } finally {
      setIsLoading(false);
    }
  }
}
