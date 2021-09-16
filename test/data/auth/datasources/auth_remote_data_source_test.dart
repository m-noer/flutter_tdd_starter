import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_tdd_starter/data/auth/datasources/auth_remote_data_source.dart';
import 'package:flutter_tdd_starter/data/auth/models/models.dart';
import 'package:flutter_tdd_starter/domain/auth/entities/request/login_body.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'auth_remote_data_source_test.mocks.dart';

@GenerateMocks([HttpClientAdapter])
void main() {
  final tdio = Dio();
  late MockHttpClientAdapter dioAdapterMock;
  late AuthRemoteDataSourceImpl remoteData;

  setUp(() {
    dioAdapterMock = MockHttpClientAdapter();
    tdio.httpClientAdapter = dioAdapterMock;
    remoteData = AuthRemoteDataSourceImpl(tdio);
  });

  group('AuthRemoteDataSource', () {
    test('should return login model', () async {
      const loginBody = LoginBody(username: 'username', password: 'password');

      final fakeData = {
        'status': 200,
        'message': 'ok',
        'data': {'token': 'token'}
      };

      final responsePayload = json.encode(fakeData);

      final httpResponse =
          ResponseBody.fromString(responsePayload, 200, headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType]
      });

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      final subject = await remoteData.requestLogin(loginBody);

      expect(subject, LoginModel.fromJson(fakeData));
    });
  });
}
