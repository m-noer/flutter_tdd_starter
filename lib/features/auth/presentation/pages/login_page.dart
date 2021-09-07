import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tdd_starter/configs/palette.dart';
import 'package:flutter_tdd_starter/core/widgets/snackbar.dart';
import 'package:flutter_tdd_starter/di/injection.dart';
import 'package:flutter_tdd_starter/features/auth/domain/entities/request/login_body.dart';
import 'package:flutter_tdd_starter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_tdd_starter/l10n/l10n.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => authBloc,
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              Get.snackbar<void>(
                'Failure',
                state.message,
                colorText: Colors.white,
                backgroundColor: Palette.dangerColor,
                margin: const EdgeInsets.all(10),
              );
            }
            if (state is AuthSuccess) {
              // Get.offAll<void>(() => const CounterPage());
              AppSnackbar.snackbarSuccess('ss', 'ss');
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Lottie.asset('assets/lotties/intro1.json'),
                    const SizedBox(height: 20),
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
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    obscure.value = !obscure.value;
                                  },
                                  icon: obscure.value
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility),
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
                            child: Text(AppLocalizations.of(context).login),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
