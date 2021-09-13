import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tdd_starter/core/constants/key_constants.dart';
import 'package:flutter_tdd_starter/core/error/failures.dart';
import 'package:flutter_tdd_starter/core/storage/shared_prefs.dart';
import 'package:flutter_tdd_starter/di/injection.dart';

import 'package:flutter_tdd_starter/features/auth/domain/entities/request/login_body.dart';
import 'package:flutter_tdd_starter/features/auth/domain/entities/response/login_entity.dart';
import 'package:flutter_tdd_starter/features/auth/domain/usecases/login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.loginUsecase) : super(AuthInitial());

  final SharedPrefs prefs = sl<SharedPrefs>();
  final LoginUsecase loginUsecase;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LoginEvent) {
      yield AuthLoading();

      final failureOrLogin = await loginUsecase.execute(event.body);
      yield* _eitherLoginOrErrorState(failureOrLogin);
    }
  }

  Stream<AuthState> _eitherLoginOrErrorState(
    Either<Failure, LoginEntity> failureOrLogin,
  ) async* {
    yield failureOrLogin.fold(
      (l) => AuthFailure(message: l.message),
      (r) {
        prefs.putString(KeyConstants.keyAccessToken, r.data.token);
        return AuthSuccess();
      },
    );
  }
}
