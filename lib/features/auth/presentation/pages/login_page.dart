import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tdd_starter/core/util/notification.dart';
import 'package:flutter_tdd_starter/core/widgets/snackbar.dart';
import 'package:flutter_tdd_starter/di/injection.dart';
import 'package:flutter_tdd_starter/features/auth/domain/entities/request/login_body.dart';
import 'package:flutter_tdd_starter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_tdd_starter/l10n/localizations.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final notificationService = sl<NotificationService>();

  // Controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Bloc
  final authBloc = sl<AuthBloc>();

  // Key
  final _formKey = GlobalKey<FormState>();

  // Var
  final ValueNotifier<bool> obscure = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    notificationService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    final labels = context.localizations;

    return Scaffold(
      body: BlocProvider(
        create: (context) => authBloc,
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              AppSnackbar.snackbarFailure('Failure', state.message);
            }

            if (state is AuthSuccess) {
              // Get.offAll<void>(() => const CounterPage());
              Get.back<void>();
              AppSnackbar.snackbarSuccess('Success', 'Berhasil Login');
            }
          },
          child: Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Lottie.asset(
                        'assets/lotties/intro1.json',
                        height: Get.height / 2.2,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 30),
                      Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              controller: usernameController,
                              decoration: const InputDecoration(
                                hintText: 'Username',
                                prefixIcon: Icon(IconlyLight.user2),
                              ),
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            ValueListenableBuilder(
                              valueListenable: obscure,
                              builder: (context, _, __) => TextFormField(
                                controller: passwordController,
                                obscureText: obscure.value,
                                decoration: InputDecoration(
                                  hintText: 'Password',
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
                                textInputAction: TextInputAction.done,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  authBloc.add(
                                    LoginEvent(
                                      LoginBody(
                                        username: usernameController.text,
                                        password: passwordController.text,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: BlocBuilder<AuthBloc, AuthState>(
                                builder: (context, state) {
                                  if (state is AuthLoading) {
                                    return const SpinKitFadingCircle(
                                      color: Colors.white,
                                      size: 30,
                                    );
                                  }
                                  return Text(labels.auth.login);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const SpinKitSquareCircle(
                      color: Colors.white,
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
