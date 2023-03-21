import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/data/network_request.dart';

final baseUrl = "http://www.google.com";
final errorUrl = "";

class MockDio extends Mock implements Dio {}

void main() {
  late NetworkService networkService;
  MockDio dio = MockDio();
  setUpAll(() {
    networkService = NetworkServiceImp(dio: dio, baseUrl: baseUrl);
  });

  group('Network Service methods test', () {
    test('Should return success when GET request status is success', () async {
      when(dio.get(baseUrl)).thenAnswer((_) => Future.value(Response(
          requestOptions: RequestOptions(path: baseUrl),
          statusCode: 200,
          data: {})));
      final response =
          await networkService.call(path: "", method: RequestMethod.get);
      expect(response.status, "Success");
    });

    test('Should return error when GET request status is error', () async {
      when(dio.get("" + "")).thenAnswer((_) => Future.value(Response(
            requestOptions: RequestOptions(path: "" + ""),
            statusCode: 400,
          )));
      final response =
          await networkService.call(path: "", method: RequestMethod.get);
      expect(response.status, "Success");
    });
  });
}
