import 'package:dio/dio.dart';
import 'package:flutter_tdd_starter/features/auth/data/models/login_model.dart';
import 'package:flutter_tdd_starter/features/auth/domain/entities/request/login_body.dart';
import 'package:flutter_tdd_starter/features/auth/domain/entities/response/login_entity.dart';

abstract class AuthRemoteDataSource {
  Future<LoginEntity> requestLogin(LoginBody body);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._client);

  final Dio _client;

  @override
  Future<LoginEntity> requestLogin(LoginBody body) async {
    final _response = await _client.post<Map<String, dynamic>>('/auth/login',
        data: body.toJson());

    return LoginModel.fromJson(_response.data!);
  }
}
