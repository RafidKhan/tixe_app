// import 'dart:convert';
// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:talker_dio_logger/talker_dio_logger.dart';
// import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
// import 'package:tixe_flutter_app/constant/app_url.dart';
// import 'package:tixe_flutter_app/constant/constant_key.dart';
// import 'package:tixe_flutter_app/data_provider/pref_helper.dart';
// import 'package:tixe_flutter_app/global/model/global_response.dart';
// import 'package:tixe_flutter_app/utils/extension.dart';
// import 'package:tixe_flutter_app/utils/view_util.dart';
//
// class ApiClient {
//   final Dio _dio = Dio();
//
//   initDio({
//     String? contentType,
//   }) {
//     _dio.options = BaseOptions(
//       baseUrl: AppUrl.base.url,
//       connectTimeout: const Duration(seconds: 60),
//       receiveTimeout: const Duration(seconds: 60),
//       sendTimeout: const Duration(seconds: 60),
//       headers: {
//         'Accept': AppConstant.APPLICATION_JSON.key,
//         'Content-Type': contentType ?? AppConstant.APPLICATION_JSON.key,
//         'Authorization':
//             'Bearer ${PrefHelper.getString(AppConstant.TOKEN.key)}',
//       },
//     );
//   }
//
//   addInterceptor() {
//     _dio.interceptors.add(
//       TalkerDioLogger(
//         settings: const TalkerDioLoggerSettings(
//           printRequestHeaders: true,
//           printResponseHeaders: true,
//           printResponseMessage: true,
//           printRequestData: true,
//           printResponseData: true,
//           printErrorData: true,
//           printErrorHeaders: true,
//           printErrorMessage: true,
//         ),
//       ),
//     );
//     // Add interceptors for error handling
//     _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
//       ('REQUEST[${options.method}] => PATH: ${AppUrl.base.url}${options.path} '
//               '=> Request Values: param: ${options.queryParameters}, => Time : ${DateTime.now()}, DATA: ${options.data}, => _HEADERS: ${options.headers} ')
//           .log();
//       return handler.next(options);
//     }, onResponse: (response, handler) {
//       ('RESPONSE[${response.statusCode}] => Time : ${DateTime.now()} => DATA: ${jsonEncode(response.data)} URL: ${response.requestOptions.baseUrl}${response.requestOptions.path} ')
//           .log();
//       return handler.next(response);
//     }, onError: (err, handler) {
//       ('ERROR[${err.response?.statusCode}] => DATA: ${jsonEncode(err.response?.data)} Message: ${err.message} URL: ${err.response?.requestOptions.baseUrl}${err.response?.requestOptions.path}')
//           .log();
//       return handler.next(err);
//     }));
//   }
//
//   // Function to perform a GET request
//   Future<void> get({
//     required String url,
//     required Function(Response? data, bool isSuccess) callback,
//   }) async {
//     try {
//       initDio();
//       addInterceptor();
//       final Response response = await _dio.get(url);
//       await _processResponse(response, callback);
//     } catch (e) {
//       await _handleError(e);
//       callback(null, false);
//     }
//   }
//
//   // Function to perform a POST request
//   Future<void> post({
//     required String url,
//     dynamic data,
//     required Function(Response? data, bool isSuccess) callback,
//   }) async {
//     try {
//       initDio();
//       addInterceptor();
//       final Response response = await _dio.post(url, data: data);
//       await _processResponse(response, callback);
//     } catch (e) {
//       await _handleError(e);
//       callback(null, false);
//     }
//   }
//
//   // Function to perform a PUT request
//   Future<void> put({
//     required String url,
//     dynamic data,
//     required Function(Response? data, bool isSuccess) callback,
//     String? contentType,
//   }) async {
//     try {
//       initDio(contentType: contentType);
//       addInterceptor();
//       final Response response = await _dio.put(
//         url,
//         data: data,
//       );
//       await _processResponse(response, callback);
//     } catch (e) {
//       await _handleError(e);
//       callback(null, false);
//     }
//   } // Function to perform a PUT request
//
//   Future<void> updatePersonalDetailsRegistration({
//     required Map<String, dynamic> data,
//     required File armsLicense,
//     required Function(Response? data, bool isSuccess) callback,
//   }) async {
//     try {
//       final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
//       data['arms_license'] = await MultipartFile.fromFile(armsLicense.path);
//       var dio = Dio();
//       var response = await dio.request(
//         AppUrl.base.url + AppUrl.registrationPersonalDetails.url,
//         options: Options(
//           method: 'PUT',
//           headers: headers,
//         ),
//         data: data,
//       );
//
//       await _processResponse(response, callback);
//     } catch (e) {
//       await _handleError(e);
//       callback(null, false);
//     }
//   }
//
//   // Function to handle response processing
//   Future<void> _processResponse(Response response,
//       Function(Response? data, bool isSuccess) callback) async {
//     'response is::A: ${response.data}'.log();
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       callback(response, true); // Success
//     } else {
//       final globalResponse = GlobalResponse.fromJson(response.data);
//       await ViewUtil.showError(globalResponse.message, from: "CASE 2");
//       callback(null, false); // Error
//     }
//   }
//
//   // Global error handler
//   Future<void> _handleError(dynamic error, {String? errorText}) async {
//     String errorMessage;
//
//     'response is::B: ${error}'.log();
//     if (error is DioException &&
//         error.response?.data is Map<String, dynamic> &&
//         error.response?.data['message'] != null) {
//       errorMessage =
//           error.response?.data['message'] ?? 'An unexpected error occurred.';
//     } else if (error is DioException) {
//       switch (error.type) {
//         case DioException.connectionTimeout:
//           errorMessage = 'Connection timed out. Please try again.';
//           break;
//         case DioException.receiveTimeout:
//           errorMessage = 'Server took too long to respond.';
//           break;
//         case DioException.badResponse:
//           errorMessage =
//               'Error: ${error.response?.statusCode} - ${error.response?.statusMessage}';
//           break;
//         default:
//           errorMessage = 'An unexpected error occurred.';
//           break;
//       }
//     } else {
//       errorMessage = errorText ?? 'An unexpected error occurred.';
//     }
//
//     await ViewUtil.showError(errorMessage, from: "CASE 1");
//   }
//}
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/constant/constant_key.dart';
import 'package:tixe_flutter_app/data_provider/pref_helper.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/network_connection.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

import '../global/model/global_response.dart';

class ApiClient {
  final Dio _dio = Dio();
  Map<String, dynamic> _header = {};

  final _timeOutDuration = const Duration(milliseconds: 30 * 1000);

  //final _timeOutDuration2 = const Duration(milliseconds: 10);

  _initDio({
    Map<String, String>? extraHeader,
    String? contentType,
  }) async {
    _header = _getHeaders(
      contentType: contentType,
      extraHeader: extraHeader,
    );

    _dio.options = BaseOptions(
      baseUrl: AppUrl.base.url,
      headers: _header,
      connectTimeout: _timeOutDuration,
      sendTimeout: _timeOutDuration,
      receiveTimeout: _timeOutDuration,
    );
    _initInterceptors();
  }

  void _initInterceptors() {
    //if (kDebugMode) {
    //_dio.interceptors.add(ChuckerDioInterceptor());
    //}
    if (kDebugMode) {
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

      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            'REQUEST[${options.method}] => PATH: ${options.baseUrl}${options.path} '
                    '=> Request Values: param: ${options.queryParameters}, DATA: ${options.data}, => _HEADERS: ${options.headers}'
                .log();
            return handler.next(options);
          },
          onResponse: (response, handler) {
            'RESPONSE[${response.statusCode}] => DATA: ${jsonEncode(response.data)} URL: ${response.requestOptions.baseUrl}${response.requestOptions.path} DateTimeTag: ${DateTime.now()}'
                .log();
            return handler.next(response);
          },
          onError: (err, handler) {
            'ERROR[${err.response?.statusCode}] => DATA: ${err.response?.data} Message: ${err.message} URL: ${err.response?.requestOptions.baseUrl}${err.response?.requestOptions.path}'
                .log();
            return handler.next(err);
          },
        ),
      );
    }
  }

  // Image or file upload using Rest handle.
  Future requestFormData({
    required String url,
    required Method method,
    Map<String, dynamic>? params,
    Options? options,
    void Function(int, int)? onReceiveProgress,
    String? savePath,
    List<File>? files,
    String? fileKeyName,
    required Function(Response? data, bool isSuccess) callback,
  }) async {
    final tokenHeader = <String, String>{
      HttpHeaders.contentTypeHeader: AppConstant.MULTIPART_FORM_DATA.key
    };
    _initDio(extraHeader: tokenHeader);

    if (files != null) {
      params?.addAll({
        "$fileKeyName": files
            .map((item) => MultipartFile.fromFileSync(item.path,
                filename: item.path.split('/').last))
            .toList()
      });
    }

    final data = params == null ? null : FormData.fromMap(params);
    // Handle and check all the status.
    return clientHandle(
      url,
      method,
      data: data,
      callback: callback,
    );
  }

  // Normal Rest API  handle.
  Future request({
    required String url,
    String? contentType,
    required Method method,
    dynamic params,
    String? token,
    Options? options,
    void Function(int, int)? onReceiveProgress,
    String? savePath,
    Map<String, String>? extraHeaders,
    required Function(Response? response, bool isSuccess) callback,
  }) async {
    //use this for extra header

    if (NetworkConnection.instance.isInternet) {
      // Handle and check all the status.
      _initDio(
        extraHeader: extraHeaders,
        contentType: contentType,
      );
      // checkProxy();
      return clientHandle(
        url,
        method,
        options: options,
        savePath: savePath,
        data: params,
        onReceiveProgress: onReceiveProgress,
        callback: callback,
      );
    }
  }

// Handle all the method and error.
  Future clientHandle(
    String url,
    Method method, {
    dynamic data,
    Options? options,
    String? savePath,
    void Function(int, int)? onReceiveProgress,
    required Function(Response? data, bool isSuccess) callback,
  }) async {
    Response response;
    try {
      // Handle response code from api.
      if (method == Method.POST) {
        response = await _dio.post(
          url,
          data: data,
          // options:  Options(contentType: Headers.formUrlEncodedContentType),
        );
      } else if (method == Method.DELETE) {
        response = await _dio.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio.patch(url);
      } else if (method == Method.DOWNLOAD) {
        response = await _dio.download(
          url,
          savePath,
          queryParameters: data,
          options: options,
          onReceiveProgress: onReceiveProgress,
        );
      } else {
        response = await _dio.get(
          url,
          queryParameters: data,
          options: options,
          onReceiveProgress: onReceiveProgress,
        );
      }

      await _processResponse(response, callback);
    } on DioException catch (e) {
      await _handleError(e);
      callback(null, false);
    } catch (e) {
      'here is: $e'.log();
      await _handleError(e);
      callback(null, false);
    }
  }

  Map<String, String> _getHeaders(
      {String? contentType, Map<String, String>? extraHeader}) {
    final deviseOs =
        Platform.isAndroid ? AppConstant.ANDROID.key : AppConstant.IOS.key;
    final headers = {
      HttpHeaders.contentTypeHeader:
          contentType ?? AppConstant.APPLICATION_JSON.key,
      HttpHeaders.authorizationHeader:
          "${AppConstant.BEARER.key} ${PrefHelper.getString(AppConstant.TOKEN.key)}",
      AppConstant.APP_VERSION.key:
          PrefHelper.getString(AppConstant.APP_VERSION.key),
      AppConstant.BUILD_NUMBER.key:
          PrefHelper.getString(AppConstant.BUILD_NUMBER.key),
      AppConstant.DEVICE_OS.key: deviseOs,
      AppConstant.LANGUAGE.key: PrefHelper.getLanguage() == 1
          ? AppConstant.EN.key
          : AppConstant.BN.key,
    };
    if (extraHeader != null) {
      headers.addAll(extraHeader);
    }

    return headers;
  }

  // Function to handle response processing
  Future<void> _processResponse(Response response,
      Function(Response? data, bool isSuccess) callback) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      callback(response, true); // Success
    } else {
      final globalResponse = GlobalResponse.fromJson(response.data);
      await ViewUtil.showError(globalResponse.message);
      callback(null, false); // Error
    }
  }

  // Global error handler
  Future<void> _handleError(dynamic error, {String? errorText}) async {
    String errorMessage;

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

    await ViewUtil.showError(errorMessage);
  }
}
