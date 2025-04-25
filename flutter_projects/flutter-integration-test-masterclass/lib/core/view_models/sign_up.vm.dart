import 'package:flutter/material.dart';

import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/core/view_models/base.vm.dart';
import 'package:flutter_starter/core/services/auth.service.dart';
import 'package:flutter_starter/core/utils/regex_validator.dart';
import 'package:flutter_starter/core/models/sign_up_payload.model.dart';

class SignUpViewModel extends BaseViewModel {
  SignUpPayload payload = SignUpPayload(
    name: "",
    email: "",
    password: "",
    retypePassword: "",
    accountType: AccountType.buyer,
  );

  final formKey = GlobalKey<FormState>();
  final _authService = locator<AuthService>();

  bool get isSeller => payload.accountType == AccountType.seller;

  void onNameChanged(String value) => payload = payload.copyWith(name: value);
  void onEmailChanged(String value) => payload = payload.copyWith(email: value);
  void onPasswordChanged(String value) => payload = payload.copyWith(password: value);
  void onReTypePasswordChanged(String value) => payload = payload.copyWith(retypePassword: value);
  void onAccountTypeChanged(bool isSeller) {
    payload = payload.copyWith(accountType: isSeller ? AccountType.seller : AccountType.buyer);
    notifyListeners();
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) return l10n.thisFieldIsRequired;
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return l10n.thisFieldIsRequired;
    if (!regexEmail.hasMatch(value)) return l10n.invalidEmail;
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return l10n.thisFieldIsRequired;
    return null;
  }

  String? retypePasswordValidator(String? value) {
    if (value == null || value.isEmpty) return l10n.thisFieldIsRequired;
    if (payload.password != payload.retypePassword) return l10n.passwordDoNoMatch;
    return null;
  }

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;
    try {
      setIsLoading(true);
      await _authService.signUp(payload.toJson());
      displaySnackBar(l10n.signUpSuccess);
      if (context.mounted) Navigator.pop(context);
    } catch (error) {
      displayApiError(error);
    } finally {
      setIsLoading(false);
    }
  }
}
