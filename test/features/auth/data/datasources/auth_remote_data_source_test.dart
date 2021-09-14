import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_tdd_starter/features/auth/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'auth_remote_data_source_test.mocks.dart';

@GenerateMocks([HttpClientAdapter])
void main() {
  final tdio = Dio();
  late MockHttpClientAdapter dioAdapterMock;

  setUp(() {
    dioAdapterMock = MockHttpClientAdapter();
    tdio.httpClientAdapter = dioAdapterMock;
  });

  group('AuthRemoteDataSource', () {
    test('should return login model', () async {
      const loginBody = LoginBody(username: 'username', password: 'password');

      final fakeData = {
        'status': 200,
        'message': 'ok',
        'data': {'token': '232qfdw'}
      };

      final responsepayload = jsonEncode(fakeData);
      final httpResponse =
          ResponseBody.fromString(responsepayload, 200, headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType]
      });

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      final response = await tdio.post<Map<String, dynamic>>('/any url',
          data: loginBody.toJson());

      expect(response.data, equals(fakeData));
    });
  });
}
