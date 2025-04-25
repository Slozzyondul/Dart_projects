import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_starter/ui/views/base.view.dart';
import 'package:flutter_starter/ui/widgets/app_button.dart';
import 'package:flutter_starter/ui/widgets/app_text_field.dart';
import 'package:flutter_starter/core/view_models/sign_up.vm.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final tt = theme.textTheme;
    return BaseView<SignUpViewModel>(
      builder: (_, vm, __) {
        return Scaffold(
          appBar: AppBar(title: Text(l10n.signUp)),
          body: SafeArea(
            child: Form(
              key: vm.formKey,
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: <Widget>[
                  AppTextField(hintText: l10n.name, validator: vm.nameValidator, onChanged: vm.onNameChanged),
                  AppTextField(
                    hintText: l10n.email,
                    validator: vm.emailValidator,
                    onChanged: vm.onEmailChanged,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  AppTextField(
                    obscureText: true,
                    hintText: l10n.password,
                    validator: vm.passwordValidator,
                    onChanged: vm.onPasswordChanged,
                  ),
                  AppTextField(
                    obscureText: true,
                    hintText: l10n.retypePassword,
                    onChanged: vm.onReTypePasswordChanged,
                    validator: vm.retypePasswordValidator,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(l10n.iamSeller, style: tt.bodyLarge),
                        Switch(value: vm.isSeller, onChanged: vm.onAccountTypeChanged),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  AppButton(title: l10n.submit, onPressed: vm.submit, isLoading: vm.isLoading),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
