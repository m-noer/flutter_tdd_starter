import 'package:flutter_tdd_starter/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_tdd_starter/core/usecases/usecase.dart';
import 'package:flutter_tdd_starter/features/auth/domain/entities/request/login_body.dart';
import 'package:flutter_tdd_starter/features/auth/domain/entities/response/login_entity.dart';
import 'package:flutter_tdd_starter/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase extends UseCase<LoginEntity, LoginBody> {
  LoginUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, LoginEntity>> call(LoginBody params) {
    return _repository.requestLogin(params);
  }
}
