import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_tdd_starter/constants/assets_constants.dart';
import 'package:flutter_tdd_starter/domain/auth/entities/entities.dart';
import 'package:flutter_tdd_starter/l10n/localizations.dart';
import 'package:flutter_tdd_starter/presentation/auth/blocs/auth_bloc.dart';
import 'package:flutter_tdd_starter/presentation/dashboard/pages/dashboard_page.dart';
import 'package:flutter_tdd_starter/utils/ui/widgets/loading_with_text.dart';
import 'package:flutter_tdd_starter/utils/ui/widgets/snackbar.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key, required this.authBloc}) : super(key: key);

  final AuthBloc authBloc;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // Controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Key
  final _formLoginKey = GlobalKey<FormState>();

  // Var
  final ValueNotifier<bool> obscure = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
  }

  void onLogin() {
    if (_formLoginKey.currentState!.validate()) {
      _formLoginKey.currentState!.save();

      final body = LoginBody(
        username: usernameController.text,
        password: passwordController.text,
      );

      widget.authBloc.add(LoginEvent(body));
    }
  }

  @override
  Widget build(BuildContext context) {
    final labels = context.localizations;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          AppSnackbar.snackbarFailure(labels.state.failure, state.message);
        }

        if (state is AuthSuccess) {
          Get.offAllNamed<void>(DashboardPage.route);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Lottie.asset(
                      AssetsConstants.intro1,
                      height: Get.height / 2.5,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 30),
                    Form(
                      key: _formLoginKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            labels.auth.login,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            key: const Key('usernameField'),
                            controller: usernameController,
                            decoration: InputDecoration(
                              hintText: labels.form.username,
                              prefixIcon: const Icon(IconlyLight.user2),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.next,
                            validator: RequiredValidator(
                              errorText: labels.form.required.username,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ValueListenableBuilder(
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
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            key: const Key('loginBtn'),
                            onPressed: onLogin,
                            child: Text(labels.auth.login),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            if (state is AuthLoading) const LoadingWithText(),
          ],
        );
      },
    );
  }
}
