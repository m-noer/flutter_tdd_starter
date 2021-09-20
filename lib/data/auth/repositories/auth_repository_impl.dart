import 'package:dartz/dartz.dart';
import 'package:flutter_tdd_starter/core/error/failures.dart';
import 'package:flutter_tdd_starter/data/auth/datasources/auth_remote_data_source.dart';
import 'package:flutter_tdd_starter/data/auth/models/models.dart';
import 'package:flutter_tdd_starter/domain/auth/entities/entities.dart';
import 'package:flutter_tdd_starter/domain/auth/repositories/repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.remoteDataSource);

  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, LoginEntity>> requestLogin(LoginBody body) async {
    final remoteLogin = await remoteDataSource.requestLogin(body);
    return Right(remoteLogin);
  }
}
