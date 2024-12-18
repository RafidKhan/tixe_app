import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/constant/constant_key.dart';
import 'package:tixe_flutter_app/data_provider/pref_helper.dart';
import 'package:tixe_flutter_app/global/model/global_response.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

class ApiClient {
  final Dio _dio = Dio();

  initDio({
    String? contentType,
  }) {
    _dio.options = BaseOptions(
      baseUrl: AppUrl.base.url,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      headers: {
        'Accept': AppConstant.APPLICATION_JSON.key,
        'Content-Type': contentType ?? AppConstant.APPLICATION_JSON.key,
        'Authorization':
            'Bearer ${PrefHelper.getString(AppConstant.TOKEN.key)}',
      },
    );
  }

  addInterceptor() {
    _dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
          printResponseMessage: true,
          printRequestData: true,
          printResponseData: true,
          printErrorData: true,
          printErrorHeaders: true,
          printErrorMessage: true,
        ),
      ),
    );
    // Add interceptors for error handling
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      ('REQUEST[${options.method}] => PATH: ${AppUrl.base.url}${options.path} '
              '=> Request Values: param: ${options.queryParameters}, => Time : ${DateTime.now()}, DATA: ${options.data}, => _HEADERS: ${options.headers} ')
          .log();
      return handler.next(options);
    }, onResponse: (response, handler) {
      ('RESPONSE[${response.statusCode}] => Time : ${DateTime.now()} => DATA: ${jsonEncode(response.data)} URL: ${response.requestOptions.baseUrl}${response.requestOptions.path} ')
          .log();
      return handler.next(response);
    }, onError: (err, handler) {
      ('ERROR[${err.response?.statusCode}] => DATA: ${jsonEncode(err.response?.data)} Message: ${err.message} URL: ${err.response?.requestOptions.baseUrl}${err.response?.requestOptions.path}')
          .log();
      return handler.next(err);
    }));
  }

  // Function to perform a GET request
  Future<void> get({
    required String url,
    required Function(Response? data, bool isSuccess) callback,
  }) async {
    try {
      initDio();
      addInterceptor();
      final Response response = await _dio.get(url);
      await _processResponse(response, callback);
    } catch (e) {
      await _handleError(e);
      callback(null, false);
    }
  }

  // Function to perform a POST request
  Future<void> post({
    required String url,
    dynamic data,
    required Function(Response? data, bool isSuccess) callback,
  }) async {
    try {
      initDio();
      addInterceptor();
      final Response response = await _dio.post(url, data: data);
      await _processResponse(response, callback);
    } catch (e) {
      await _handleError(e);
      callback(null, false);
    }
  }

  // Function to perform a PUT request
  Future<void> put({
    required String url,
    dynamic data,
    required Function(Response? data, bool isSuccess) callback,
    String? contentType,
  }) async {
    try {
      initDio(contentType: contentType);
      addInterceptor();
      final Response response = await _dio.put(
        url,
        data: data,
      );
      await _processResponse(response, callback);
    } catch (e) {
      await _handleError(e);
      callback(null, false);
    }
  } // Function to perform a PUT request

  Future<void> updatePersonalDetailsRegistration({
    required Map<String, dynamic> data,
    required File armsLicense,
    required Function(Response? data, bool isSuccess) callback,
  }) async {
    try {
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      data['arms_license'] = await MultipartFile.fromFile(armsLicense.path);
      var dio = Dio();
      var response = await dio.request(
        AppUrl.base.url + AppUrl.registrationPersonalDetails.url,
        options: Options(
          method: 'PUT',
          headers: headers,
        ),
        data: data,
      );

      await _processResponse(response, callback);
    } catch (e) {
      await _handleError(e);
      callback(null, false);
    }
  }

  // Function to handle response processing
  Future<void> _processResponse(Response response,
      Function(Response? data, bool isSuccess) callback) async {
    'response is::A: ${response.data}'.log();
    if (response.statusCode == 200 || response.statusCode == 201) {
      callback(response, true); // Success
    } else {
      final globalResponse = GlobalResponse.fromJson(response.data);
      await ViewUtil.showError(globalResponse.message, from: "CASE 2");
      callback(null, false); // Error
    }
  }

  // Global error handler
  Future<void> _handleError(dynamic error, {String? errorText}) async {
    String errorMessage;

    'response is::B: ${error}'.log();
    if (error is DioException &&
        error.response?.data is Map<String, dynamic> &&
        error.response?.data['message'] != null) {
      errorMessage =
          error.response?.data['message'] ?? 'An unexpected error occurred.';
    } else if (error is DioException) {
      switch (error.type) {
        case DioException.connectionTimeout:
          errorMessage = 'Connection timed out. Please try again.';
          break;
        case DioException.receiveTimeout:
          errorMessage = 'Server took too long to respond.';
          break;
        case DioException.badResponse:
          errorMessage =
              'Error: ${error.response?.statusCode} - ${error.response?.statusMessage}';
          break;
        default:
          errorMessage = 'An unexpected error occurred.';
          break;
      }
    } else {
      errorMessage = errorText ?? 'An unexpected error occurred.';
    }

    await ViewUtil.showError(errorMessage, from: "CASE 1");
  }
}
