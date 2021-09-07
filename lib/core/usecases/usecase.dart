import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tdd_starter/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);

  Future<Either<Failure, Type>> execute(Params params) {
    return call(params).onError((error, stackTrace) {
      Failure failure;
      if (error is Failure) {
        failure = error;
      } else if (error is DioError) {
        if (error.response!.statusCode! < 500) {
          failure = ServerFailure(error.response!.data['message'].toString());
        } else {
          failure = ServerFailure(error.response!.statusMessage!);
        }
      } else {
        failure = ServerFailure(error.toString());
      }
      return Future.value(Left(failure));
    });
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
