import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/_lib.dart';

class MockApiModel extends Mock implements ApiModel {}

void main() {
  group('ApiModel', () {
    test('should handle DioErrorType.cancel', () {
      final dioError = DioError(
        type: DioErrorType.cancel,
        error: 'Request was cancelled',
        requestOptions: RequestOptions(path: ''),
      );
      final apiModel = ApiModel.handleResponse(dioError);

      expect(apiModel.status, 'Request Cancelled');
      expect(apiModel.message, 'Request was cancelled');
    });

    test('should handle DioErrorType.connectTimeout', () {
      final dioError = DioError(
        type: DioErrorType.connectTimeout,
        error: 'Connection timeout',
        requestOptions: RequestOptions(path: ''),
      );
      final apiModel = ApiModel.handleResponse(dioError);

      expect(apiModel.status, 'Connection Timeout');
      expect(apiModel.message, 'Connection timeout');
    });
    test('should handle DioErrorType.other', () {
      final dioError = DioError(
        type: DioErrorType.other,
        error: 'Connection failed. Check internet connection',
        requestOptions: RequestOptions(path: ''),
      );
      final apiModel = ApiModel.handleResponse(dioError);

      expect(apiModel.status, 'Network Error');
      expect(apiModel.message, 'Connection failed. Check internet connection');
    });

    test('should handle DioErrorType.receiveTimeout', () {
      final dioError = DioError(
        type: DioErrorType.receiveTimeout,
        error: 'Receive timeout in connection',
        requestOptions: RequestOptions(path: ''),
      );
      final apiModel = ApiModel.handleResponse(dioError);

      expect(apiModel.status, 'Receive Timeout');
      expect(apiModel.message, 'Receive timeout in connection');
    });

    test('should handle DioErrorType.response with statusCode 300', () {
      final response = Response(
        data: {'message': 'Session timeout'},
        statusCode: 300,
        requestOptions: RequestOptions(path: ''),
      );
      final dioError = DioError(
        type: DioErrorType.response,
        response: response,
        requestOptions: RequestOptions(path: ''),
      );
      final apiModel = ApiModel.handleResponse(dioError);

      expect(apiModel.status, 'Session Timeout');
      expect(apiModel.message, isA<String>());
    });

    test('should handle DioErrorType.response with statusCode 500', () {
      final response = Response(
        data: {'message': 'A Server error occurred'},
        statusCode: 500,
        requestOptions: RequestOptions(path: ''),
      );
      final dioError = DioError(
        type: DioErrorType.response,
        response: response,
        requestOptions: RequestOptions(path: ''),
      );
      final apiModel = ApiModel.handleResponse(dioError);

      expect(apiModel.status, 'Server Failure');
      expect(apiModel.message, 'A Server error occurred');
    });

    test('should handle DioErrorType.response with statusCode 401', () {
      final response = Response(
        data: {'message': 'Unauthorized request'},
        statusCode: 401,
        requestOptions: RequestOptions(path: ''),
      );
      final dioError = DioError(
        type: DioErrorType.response,
        response: response,
        requestOptions: RequestOptions(path: ''),
      );
      final apiModel = ApiModel.handleResponse(dioError);

      expect(apiModel.status, 'Unauthorised');
      expect(apiModel.message, 'Unauthorized request');
    });

    test('should handle DioErrorType.response with unknown error data', () {
      final response = Response(
        data: {'foo': 'bar'},
        statusCode: 400,
        requestOptions: RequestOptions(path: ''),
      );
      final dioError = DioError(
        type: DioErrorType.response,
        response: response,
        requestOptions: RequestOptions(path: ''),
      );
      final apiModel = ApiModel.handleResponse(dioError);

      expect(apiModel.status, isA<String>());
      expect(
          apiModel.message, 'An unexpected error occurred, please try again');
    });

    test('should handle DioErrorType.sendTimeout', () {
      final dioError = DioError(
        type: DioErrorType.sendTimeout,
        error: 'Send timeout in connection',
        requestOptions: RequestOptions(path: ''),
      );
      final apiModel = ApiModel.handleResponse(dioError);

      expect(apiModel.status, 'SEND_TIMEOUT');
      expect(apiModel.message, isA<String>());
    });
  });
}
