import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tdd_starter/core/constants/assets_constants.dart';
import 'package:flutter_tdd_starter/core/utils/ui/widgets/loading_with_text.dart';
import 'package:flutter_tdd_starter/core/utils/ui/widgets/snackbar.dart';
import 'package:flutter_tdd_starter/data/auth/models/models.dart';
import 'package:flutter_tdd_starter/l10n/localizations.dart';
import 'package:flutter_tdd_starter/presentation/auth/blocs/auth_bloc.dart';
import 'package:flutter_tdd_starter/presentation/auth/widgets/login_form.dart';
import 'package:flutter_tdd_starter/presentation/dashboard/pages/dashboard_page.dart';
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

  @override
  void initState() {
    super.initState();
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
                      height: Get.height / 2.4,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 28),
                    FormLogin(
                      formLoginKey: _formLoginKey,
                      usernameController: usernameController,
                      passwordController: passwordController,
                      onLogin: onLogin,
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
}
