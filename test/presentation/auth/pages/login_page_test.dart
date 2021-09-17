import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_tdd_starter/domain/auth/entities/entities.dart';
import 'package:flutter_tdd_starter/presentation/auth/bloc/auth_bloc.dart';
import 'package:flutter_tdd_starter/presentation/auth/pages/login_page.dart';
import 'package:flutter_tdd_starter/presentation/core/widgets/loading_with_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/pump_app.dart';

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class AuthStateFake extends Fake implements AuthState {}

class AuthEventFake extends Fake implements AuthEvent {}

// @GenerateMocks([AuthBloc, LoginUsecase])
void main() {
  // widgetSetup();

  group('Login Page ...', () {
    late AuthBlocMock authBlocMock;

    const loginEntity = LoginEntity(
      data: DataLoginEntity(
        token: 'token',
      ),
      status: 200,
      message: 'message',
    );

    setUpAll(() {
      registerFallbackValue<AuthEvent>(AuthEventFake());
      registerFallbackValue<AuthState>(AuthStateFake());
    });

    setUp(() {
      authBlocMock = AuthBlocMock();
      when(() => authBlocMock.state).thenReturn(AuthInitial());
      when(() => authBlocMock.loginUsecase.execute(any()))
          .thenAnswer((_) => Future.value(const Right(loginEntity)));
    });

    // final usernameField = find.byKey(const Key('usernameField'));
    // final passwordField = find.byKey(const Key('passwordField'));
    // final loginBtn = find.byKey(const Key('loginBtn'));

    testWidgets('login page ...', (tester) async {
      when(() => authBlocMock.state).thenReturn(AuthLoading());

      await tester.pumpApp(
        BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
          child: Scaffold(
            body: LoginView(authBloc: authBlocMock),
          ),
        ),
      );

      //   // expect(find.byType(DashboardPage), findsOneWidget);

      //   // expect(find.byType(LoginForm), findsOneWidget);
      //   // expect(usernameField, findsOneWidget);
      //   // expect(passwordField, findsOneWidget);
      //   // expect(loginBtn, findsOneWidget);

      //   // await tester.tap(loginBtn);
      //   // await tester.pump();
      //   // expect(find.text('Please enter the username'), findsOneWidget);
      //   // expect(find.text('Please enter a password'), findsOneWidget);

      //   await tester.enterText(usernameField, 'guru1');
      //   await tester.enterText(passwordField, 'password');

      //   await tester.tap(loginBtn);
      //   await tester.pump();

      expect(find.byType(LoadingWithText), findsOneWidget);

      //   // verify(() => authBlocMock.add(const LoginEvent(
      //   //     LoginBody(username: 'guru1', password: 'password')))).called(1);
    });

    testWidgets('AuthFailure', (tester) async {
      // when(() => authBlocMock.state)
      //     .thenReturn(const AuthFailure(message: 'fail'));
      final snackBarFailureFinder = find.byKey(const Key('snack_bar_failure'));

      whenListen(
          authBlocMock,
          Stream.fromIterable(
              [AuthLoading(), const AuthFailure(message: 'fail')]));

      await tester.pumpApp(
        BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
          child: Scaffold(
            body: LoginView(authBloc: authBlocMock),
          ),
        ),
      );
      expect(snackBarFailureFinder, findsNothing);
      // await tester.pump();

      // expect(snackBarFailureFinder, findsOneWidget);

      // await tester.enterText(usernameField, 'guru1');
      // await tester.enterText(passwordField, 'password');

      // await tester.tap(loginBtn);
      // await tester.pump();

      // expect(find.text('fail'), findsOneWidget);
      // expect(find.byKey(const Key('snack_bar_failure')), findsOneWidget);
    });

    testWidgets('Obscure icon button', (tester) async {
      await tester.pumpApp(
        BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
          child: Scaffold(
            body: LoginView(authBloc: authBlocMock),
          ),
        ),
      );

      await tester.tap(find.byKey(const Key('obscureButton')));
      await tester.pump();
      expect(find.byIcon(IconlyLight.hide), findsOneWidget);
    });
  });
}
