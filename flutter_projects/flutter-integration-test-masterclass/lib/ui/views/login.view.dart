import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_starter/ui/views/base.view.dart';
import 'package:flutter_starter/ui/views/sign_up.view.dart';
import 'package:flutter_starter/ui/widgets/app_button.dart';
import 'package:flutter_starter/core/view_models/login.vm.dart';
import 'package:flutter_starter/ui/widgets/app_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final l10n = AppLocalizations.of(context)!;
    final viewInsets = MediaQuery.of(context).viewInsets;

    final tt = theme.textTheme;

    return BaseView<LoginViewModel>(
      builder: (_, vm, __) {
        return Scaffold(
          body: Form(
            key: vm.formKey,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: SizedBox(
                width: size.width,
                height: viewInsets.bottom > 0 ? size.height * 0.7 : size.height,
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      const Spacer(flex: 3),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 40,
                          maxHeight: size.height * 0.08,
                        ),
                        child: Image.asset(
                          "images/wootcot-simplified.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Spacer(flex: 3),
                      Text(
                        l10n.pleaseLogin,
                        style: tt.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold, letterSpacing: 1.5),
                      ),
                      const SizedBox(height: 5),
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
                      const SizedBox(height: 10),
                      AppButton(
                          title: l10n.login,
                          onPressed: vm.login,
                          isLoading: vm.isLoading),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(l10n.doNotHaveAnAccount),
                          TextButton(
                            child: Text(l10n.signUpExclamation,
                                style: tt.bodyLarge),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SignUpView()));
                            },
                          )
                        ],
                      ),
                      const Spacer(flex: 1),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
