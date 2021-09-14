import 'package:dartz/dartz.dart';
import 'package:flutter_tdd_starter/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_tdd_starter/features/auth/data/repositories/repository_impl.dart';
import 'package:flutter_tdd_starter/features/auth/domain/entities/entities.dart';
import 'package:flutter_tdd_starter/features/auth/domain/entities/request/login_body.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource])
void main() {
  group('AuthRepositoryImpl', () {
    final mockAuthRemoteDataSource = MockAuthRemoteDataSource();

    test('test auth repository impl', () async {
      final repository = AuthRepositoryImpl(mockAuthRemoteDataSource);

      const loginBody = LoginBody(username: 'username', password: 'password');

      const loginEntity = LoginEntity(
        data: DataLoginEntity(
          token: 'token',
        ),
        status: 200,
        message: 'message',
      );

      // Arrange - Given
      when(mockAuthRemoteDataSource.requestLogin(any)).thenAnswer(
        (realInvocation) => Future.value(loginEntity),
      );

      // Act - When
      final result = await repository.requestLogin(loginBody);

      // Assert - Then
      expect(result, const Right<dynamic, LoginEntity>(loginEntity));
    });
  });
}
