import 'package:dio/dio.dart';
import 'package:tech_task/_lib.dart';

// This custom class handle all kinds of Api error both from the api and exception error.
// The essential ones where handle to prevent app crashing make the application fail.
class ApiModel {
  final String status;
  final String message;
  final dynamic data;
  ApiModel({required this.status, required this.message, this.data});

  factory ApiModel.handleResponse(Object error) {
    String status = '';
    String message = '';
    if (error is DioError) {
      var dioError = error;
      switch (dioError.type) {
        case DioErrorType.cancel:
          message = 'Request was cancelled';
          status = 'Request Cancelled';
          break;
        case DioErrorType.connectTimeout:
          message = 'Connection timeout';
          status = 'Connection Timeout';
          break;
        case DioErrorType.other:
          message = 'Connection failed. Check internet connection';
          status = 'Network Error';
          break;
        case DioErrorType.other:
          message = 'Connection failed. Check internet connection';
          status = 'Network Error';
          break;
        case DioErrorType.receiveTimeout:
          message = 'Receive timeout in connection';
          status = 'Receive Timeout';
          break;
        case DioErrorType.response:
          if (dioError.response!.statusCode == 300) {
            message = 'Session timeout';
            status = 'Session Timeout';
            // SessionTimeoutProvider.logoutUser();
          } else if (dioError.response!.statusCode == 500) {
            message = 'A Server error occurred';
            status = 'Server Failure';
          } else if (dioError.response!.statusCode == 401) {
            message = 'Unauthorized request';
            status = 'Unauthorised';
          } else {
            final errorData = extractDataFromResponse(error.response!);

            status = errorData['status'] ?? '';
            message = errorData['message'] ?? '';
          }
          break;
        case DioErrorType.sendTimeout:
          message = 'Send timeout in connection';
          status = 'SEND_TIMEOUT';
          break;
        default:
          message = 'An error occured';
          status = 'Error';
          break;
      }
    } else {
      status = "Error";
      message = _handleException(error);
    }
    appPrint('status: $status, message: $message');
    return ApiModel(status: status, message: message);
  }

  static String _handleException(dynamic exception) {
    if (exception is String) {
      return exception;
    } else {
      return 'An unexpected error occurred, please try again';
    }
  }

  static Map<String, String> extractDataFromResponse(Response response) {
    var message = '';
    String status = '';

    var decodeResponse = response.data;

    if (response.data != null) {
      if (decodeResponse['message'] != null) {
        message = decodeResponse['message'];
      } else if (decodeResponse['status'] != null) {
        message = decodeResponse['status'];
      } else {
        message = 'An unexpected error occurred, please try again';
      }
      status = decodeResponse['code'] ?? "Error";
    } else {
      message = response.statusMessage ?? '';
      status = decodeResponse['code'] ?? "Error";
    }

    return {'message': message, 'status': status};
  }
}
