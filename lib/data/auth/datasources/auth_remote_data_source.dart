import 'package:dio/dio.dart';
import 'package:flutter_tdd_starter/data/auth/models/models.dart';
import 'package:flutter_tdd_starter/domain/auth/entities/entities.dart';

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
