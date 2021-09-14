import 'package:flutter_tdd_starter/features/auth/domain/entities/entities.dart';
import 'package:flutter_tdd_starter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthEvent', () {
    group('LoginEvent', () {
      const loginBody = LoginBody(username: 'username', password: 'password');
      test('return correct props', () {
        expect(const LoginEvent(loginBody).props, [loginBody]);
      });
    });
  });
}