import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_tdd_starter/l10n/localizations.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required GlobalKey<FormState> formLoginKey,
    required this.usernameController,
    required this.passwordController,
    required this.obscure,
    this.onLogin,
  })  : _formLoginKey = formLoginKey,
        super(key: key);

  final GlobalKey<FormState> _formLoginKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final ValueNotifier<bool> obscure;
  final Function()? onLogin;

  @override
  Widget build(BuildContext context) {
    final labels = context.localizations;

    return Form(
      key: _formLoginKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            labels.auth.login,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 20),
          _buildUsernameField(labels),
          const SizedBox(height: 10),
          _buildPasswordField(labels),
          const SizedBox(height: 20),
          ElevatedButton(
            key: const Key('loginBtn'),
            onPressed: onLogin,
            child: Text(labels.auth.login),
          ),
        ],
      ),
    );
  }

  Widget _buildUsernameField(AppLocalizationsData labels) {
    return TextFormField(
      key: const Key('usernameField'),
      controller: usernameController,
      decoration: InputDecoration(
        hintText: labels.form.username,
        prefixIcon: const Icon(IconlyLight.user2),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      validator: RequiredValidator(
        errorText: labels.form.required.username,
      ),
    );
  }

  Widget _buildPasswordField(AppLocalizationsData labels) {
    return ValueListenableBuilder(
      valueListenable: obscure,
      builder: (context, _, __) => TextFormField(
        key: const Key('passwordField'),
        controller: passwordController,
        obscureText: obscure.value,
        decoration: InputDecoration(
          hintText: labels.form.password,
          prefixIcon: const Icon(IconlyLight.lock),
          suffixIcon: IconButton(
            onPressed: () {
              obscure.value = !obscure.value;
            },
            icon: obscure.value
                ? const Icon(IconlyLight.show)
                : const Icon(IconlyLight.hide),
          ),
        ),
        validator: RequiredValidator(
          errorText: labels.form.required.password,
        ),
      ),
    );
  }
}
