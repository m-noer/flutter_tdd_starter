import 'dart:ui';

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
import 'package:flutter_tdd_starter/features/auth/presentation/pages/dashboard_page.dart';
import 'package:flutter_tdd_starter/l10n/localizations.dart';
import 'package:form_field_validator/form_field_validator.dart';
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
  final _formLoginKey = GlobalKey<FormState>();

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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocProvider(
        create: (context) => authBloc,
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              AppSnackbar.snackbarFailure(labels.state.failure, state.message);
            }

            if (state is AuthSuccess) {
              Get.offAll<void>(() => const DashboardPage());
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
                          'assets/lotties/intro1.json',
                          height: Get.height / 2.4,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 30),
                        Form(
                          key: _formLoginKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                labels.auth.login,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: usernameController,
                                decoration: InputDecoration(
                                  hintText: labels.form.username,
                                  prefixIcon: const Icon(IconlyLight.user2),
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                textInputAction: TextInputAction.next,
                                validator: RequiredValidator(
                                    errorText: labels.form.required.username),
                              ),
                              const SizedBox(height: 10),
                              ValueListenableBuilder(
                                valueListenable: obscure,
                                builder: (context, _, __) => TextFormField(
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
                                      errorText: labels.form.required.password),
                                ),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formLoginKey.currentState!.validate()) {
                                    _formLoginKey.currentState!.save();

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
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Daftar'),
                        )
                      ],
                    ),
                  ),
                ),
                if (state is AuthLoading)
                  Container(
                    color: Colors.black.withOpacity(0.8),
                    width: double.infinity,
                    height: Get.height,
                    child: Center(
                      child: Wrap(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: SpinKitCircle(
                                    color: Colors.blue,
                                    size: 40,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  labels.state.loading,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
