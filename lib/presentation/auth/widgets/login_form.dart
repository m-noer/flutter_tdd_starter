import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_tdd_starter/l10n/localizations.dart';
import 'package:form_field_validator/form_field_validator.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    Key? key,
    required this.formLoginKey,
    required this.usernameController,
    required this.passwordController,
    this.onLogin,
  }) : super(key: key);

  final GlobalKey<FormState> formLoginKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final Function()? onLogin;

  @override
  Widget build(BuildContext context) {
    final labels = context.localizations;

    return Form(
      key: formLoginKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            labels.auth.login,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 20),
          _UsernameField(
              usernameController: usernameController, labels: labels),
          const SizedBox(height: 10),
          _PasswordField(
            passwordController: passwordController,
            labels: labels,
          ),
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
}

class _UsernameField extends StatelessWidget {
  const _UsernameField({
    Key? key,
    required this.usernameController,
    required this.labels,
  }) : super(key: key);

  final TextEditingController usernameController;
  final AppLocalizationsData labels;

  @override
  Widget build(BuildContext context) {
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
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({
    Key? key,
    required this.passwordController,
    required this.labels,
  }) : super(key: key);

  final TextEditingController passwordController;
  final AppLocalizationsData labels;

  @override
  Widget build(BuildContext context) {
    final obscure = ValueNotifier<bool>(true);

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
            key: const Key('obscureButton'),
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
