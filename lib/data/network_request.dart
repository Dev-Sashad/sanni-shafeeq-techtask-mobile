import 'dart:io';
import 'package:path/path.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:tech_task/_lib.dart';

abstract class NetworkService {
  Future<ApiModel> call({
    required String path,
    required RequestMethod method,
    Map<String, dynamic> body = const {},
    Map<String, dynamic> queryParams = const {},
  });
  Future<ApiModel> upload(
      {required String path,
      Map<String, dynamic> body = const {},
      Map<String, File> files = const {}});
}

class DioService {
  Dio getDioInstance() {
    var dio = Dio(
      BaseOptions(
        connectTimeout: 15000,
        receiveTimeout: 15000,
        // headers: {
        //   'Content-Type': 'application/json',
        //   'Accept': 'application/json',
        // },
      ),
    );
    // dio.interceptors.add(AppInterceptor());
    //Pretty Dio logger is a Dio interceptor that logs network calls in a pretty, easy to read format.
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: false,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

    //Retry after failure
    dio.interceptors.add(RetryInterceptor(
      dio: dio,
      logPrint: print, // specify log function (optional)
      retries: 0, // retry count (optional)
      retryDelays: const [
        // set delays between retries (optional)
        Duration(seconds: 1), // wait 1 sec before first retry
        Duration(seconds: 2), // wait 2 sec before second retry
        Duration(seconds: 3), // wait 3 sec before third retry
      ],
    ));

    dio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: false));

    return dio;
  }
}

class NetworkServiceImp extends NetworkService {
  final String baseUrl;
  final Dio dio;

  NetworkServiceImp({required this.dio, required this.baseUrl});

  @override
  Future<ApiModel> call({
    required String? path,
    required RequestMethod? method,
    Map<String, dynamic> body = const {},
    Map<String, dynamic> queryParams = const {},
  }) async {
    Response response;
    var url = baseUrl + path!;
    appPrint(url);
    dio.options.headers.addAll(
      {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    try {
      switch (method!) {
        case RequestMethod.get:
          response = await dio.get(url, queryParameters: queryParams);
          break;
        case RequestMethod.post:
          response = await dio.post(url,
              data: FormData.fromMap(body),
              queryParameters: queryParams,
              options: Options(contentType: 'application/json'));
          break;
        case RequestMethod.patch:
          response = await dio.patch(url,
              data: FormData.fromMap(body), queryParameters: queryParams);
          break;
        case RequestMethod.put:
          response = await dio.put(url,
              data: FormData.fromMap(body), queryParameters: queryParams);
          break;
        case RequestMethod.delete:
          response = await dio.delete(url,
              data: FormData.fromMap(body), queryParameters: queryParams);
          break;
      }
    } catch (e) {
      return ApiModel.handleResponse(e);
    }
    if (response.data == null) {
      return ApiModel(status: 'Error', message: 'An error occured');
    }

    return ApiModel(status: "Success", message: "Success", data: response.data);
  }

  @override
  Future<ApiModel> upload(
      {required String path,
      Map<String, dynamic> body = const {},
      Map<String, File> files = const {}}) async {
    Response response;
    var url = baseUrl + path;
    try {
      Map<String, MultipartFile> fileMap = {};
      for (MapEntry fileEntry in files.entries) {
        File file = fileEntry.value;
        String fileName = basename(file.path);
        fileMap[fileEntry.key] = MultipartFile(
            file.openRead(), await file.length(),
            filename: fileName);
      }
      body.addAll(fileMap);
      var formData = FormData.fromMap(body);

      response = await dio.post(url,
          data: formData, options: Options(contentType: 'multipart/form-data'));
    } catch (e) {
      return ApiModel.handleResponse(e);
    }
    if (response.data == null) {
      return ApiModel(status: 'Error', message: 'An error occured');
    }

    return ApiModel(status: "Success", message: "Success", data: response.data);
  }
}

enum RequestMethod { get, post, put, patch, delete }
