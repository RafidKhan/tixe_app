import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/constant/constant_key.dart';
import 'package:tixe_flutter_app/data_provider/pref_helper.dart';
import 'package:tixe_flutter_app/global/model/global_response.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

class ApiClient {
  final Dio _dio;

  ApiClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: AppUrl.base.url,
            connectTimeout: const Duration(seconds: 60),
            receiveTimeout: const Duration(seconds: 60),
            sendTimeout: const Duration(seconds: 60),
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'Authorization':
                  'Bearer ${PrefHelper.getString(AppConstant.TOKEN.key)}',
            },
          ),
        ) {
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
      Response response = await _dio.get(url);
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
      Response response = await _dio.post(url, data: data);
      await _processResponse(response, callback);
    } catch (e) {
      'exs is:: $e'.log();
      await _handleError(e);
      callback(null, false);
    }
  }

  // Function to handle response processing
  Future<void> _processResponse(Response response,
      Function(Response? data, bool isSuccess) callback) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      'here is:: ${response.statusCode}'.log();
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

    if (error is DioException) {
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
