import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late AuthBlocMock authBlocMock;

  setUp(() {
    authBlocMock = AuthBlocMock();
  });

  // widgetSetup();

  group('Login Page ...', () {
    setUpAll(() {
      registerFallbackValue<AuthEvent>(AuthEventFake());
      registerFallbackValue<AuthState>(AuthStateFake());
    });

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

      final usernameField = find.byKey(const Key('usernameField'));
      final passwordField = find.byKey(const Key('passwordField'));
      final loginBtn = find.byKey(const Key('loginBtn'));

      // expect(find.byType(DashboardPage), findsOneWidget);

      // expect(find.byType(LoginForm), findsOneWidget);
      // expect(usernameField, findsOneWidget);
      // expect(passwordField, findsOneWidget);
      // expect(loginBtn, findsOneWidget);

      // await tester.tap(loginBtn);
      // await tester.pump();
      // expect(find.text('Please enter the username'), findsOneWidget);
      // expect(find.text('Please enter a password'), findsOneWidget);

      await tester.enterText(usernameField, 'guru1');
      await tester.enterText(passwordField, 'password');

      await tester.tap(loginBtn, warnIfMissed: false);
      await tester.pump();

      expect(find.byType(LoadingWithText), findsOneWidget);
    });
  });
}
