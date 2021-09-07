import 'package:flutter_tdd_starter/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_tdd_starter/features/auth/domain/entities/response/login_entity.dart';
import 'package:flutter_tdd_starter/features/auth/domain/entities/request/login_body.dart';
import 'package:flutter_tdd_starter/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_tdd_starter/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.remoteDataSource);

  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, LoginEntity>> requestLogin(LoginBody body) async {
    final remoteLogin = await remoteDataSource.requestLogin(body);
    return Right(remoteLogin);
  }
}
