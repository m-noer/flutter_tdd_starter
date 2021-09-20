import 'package:dartz/dartz.dart';
import 'package:flutter_tdd_starter/core/error/failures.dart';
import 'package:flutter_tdd_starter/core/usecases/usecase.dart';
import 'package:flutter_tdd_starter/data/auth/models/models.dart';
import 'package:flutter_tdd_starter/domain/auth/entities/entities.dart';
import 'package:flutter_tdd_starter/domain/auth/repositories/repository.dart';

class LoginUsecase extends UseCase<LoginEntity, LoginBody> {
  LoginUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, LoginEntity>> call(LoginBody params) {
    return _repository.requestLogin(params);
  }
}
