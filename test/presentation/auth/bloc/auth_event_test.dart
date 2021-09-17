import 'package:flutter_tdd_starter/domain/auth/entities/entities.dart';
import 'package:flutter_tdd_starter/presentation/auth/blocs/auth_bloc.dart';
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
