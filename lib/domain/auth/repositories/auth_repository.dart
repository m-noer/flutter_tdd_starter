import 'package:dartz/dartz.dart';
import 'package:flutter_tdd_starter/core/error/failures.dart';
import 'package:flutter_tdd_starter/data/auth/models/models.dart';
import 'package:flutter_tdd_starter/domain/auth/entities/entities.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> requestLogin(LoginBody body);
}
