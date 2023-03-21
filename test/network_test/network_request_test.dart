import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/_lib.dart';
import 'package:tech_task/data/network_request.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('NetworkServiceImp', () {
    final dio = MockDio();
    final baseUrl = 'http://localhost:3000';
    final getUrl =
        'https://lb7u7svcm5.execute-api.ap-southeast-1.amazonaws.com/dev/';

    test('upload() method should return ApiModel', () async {
      final networkService = NetworkServiceImp(dio: dio, baseUrl: baseUrl);
      final files = {
        'file': File('path/to/file.jpg'),
      };
      final response = await networkService.upload(
        path: '/upload',
        files: files,
      );

      expect(response, isA<ApiModel>());
      expect(response.status, equals('Error'));
      expect(response.message, isA<String>());
      expect(response.data, isNull);
    });

    test('call() method should return ApiModel', () async {
      final result = Response<dynamic>(
        requestOptions: RequestOptions(
          path: getUrl,
          contentType: 'application/json',
        ),
        statusCode: 200,
        data: [
          {"title": "Ham", "use-by": "2020-11-25"},
        ],
      );
      print('valuuuuuuuee $result');
      when(dio.get(getUrl,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ))).thenReturn(Future.value(result));

      final networkService = NetworkServiceImp(dio: dio, baseUrl: getUrl);
      final response = await networkService.call(
        path: '',
        method: RequestMethod.get,
      );

      expect(response, isA<ApiModel>());
      expect(response.status, equals('Success'));
      expect(response.message, isA<String>());
      expect(response.data, equals(result.data));
    });
  });
}
