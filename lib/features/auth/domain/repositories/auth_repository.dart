import 'package:dartz/dartz.dart';
import 'package:flutter_tdd_starter/core/error/failures.dart';
import 'package:flutter_tdd_starter/features/auth/domain/entities/request/login_body.dart';
import 'package:flutter_tdd_starter/features/auth/domain/entities/response/login_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> requestLogin(LoginBody body);
}
