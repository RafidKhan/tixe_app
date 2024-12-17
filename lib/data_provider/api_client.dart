// import 'dart:convert';
// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
//
// import '/constant/app_url.dart';
// import '/constant/constant_key.dart';
// import '/data_provider/pref_helper.dart';
// import '/utils/enum.dart';
// import '/utils/extension.dart';
// import '/utils/navigation.dart';
// import '/utils/network_connection.dart';
// import '/utils/view_util.dart';
//
// class ApiClient {
//   final Dio _dio = Dio();
//   Map<String, dynamic> _header = {};
//   bool isPopDialog = false;
//
//   _initDio({Map<String, String>? extraHeader}) async {
//     _header = _getHeaders();
//     if (extraHeader != null) {
//       _header.addAll(extraHeader);
//     }
//
//     const timeOutDuration = Duration(seconds: 60);
//
//     _dio.options = BaseOptions(
//       baseUrl: AppUrl.base.url,
//       headers: _header,
//       connectTimeout: timeOutDuration,
//       sendTimeout: timeOutDuration,
//       receiveTimeout: timeOutDuration,
//     );
//     _initInterceptors();
//   }
//
//   void _initInterceptors() {
//     _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
//       debugPrint(
//           'REQUEST[${options.method}] => PATH: ${AppUrl.base.url}${options.path} '
//           '=> Request Values: param: ${options.queryParameters}, => Time : ${DateTime.now()}, DATA: ${options.data}, => _HEADERS: ${options.headers} ');
//       return handler.next(options);
//     }, onResponse: (response, handler) {
//       debugPrint(
//           'RESPONSE[${response.statusCode}] => Time : ${DateTime.now()} => DATA: ${jsonEncode(response.data)} URL: ${response.requestOptions.baseUrl}${response.requestOptions.path} ');
//       return handler.next(response);
//     }, onError: (err, handler) {
//       debugPrint(
//           'ERROR[${err.response?.statusCode}] => DATA: ${jsonEncode(err.response?.data)} Message: ${err.message} URL: ${err.response?.requestOptions.baseUrl}${err.response?.requestOptions.path}');
//       return handler.next(err);
//     }));
//   }
//
//   // Image or file upload using Rest handle.
//   Future requestFormData({
//     required String url,
//     required Method method,
//     Map<String, dynamic>? params,
//     bool? isPopGlobalDialog,
//     Map<String, String>? extraHeaders,
//     Options? options,
//     void Function(int, int)? onReceiveProgress,
//     String? savePath,
//     List<File>? files,
//     String? fileKeyName,
//     required Function(Response response) onSuccessFunction,
//   }) async {
//     final tokenHeader = <String, String>{
//       HttpHeaders.contentTypeHeader: AppConstant.MULTIPART_FORM_DATA.key
//     };
//     if (extraHeaders != null) {
//       tokenHeader.addAll(extraHeaders);
//     }
//     _initDio(extraHeader: tokenHeader);
//
//     if (files != null) {
//       params?.addAll({
//         "$fileKeyName": files
//             .map((item) => MultipartFile.fromFileSync(item.path,
//                 filename: item.path.split('/').last))
//             .toList()
//       });
//     }
//
//     final data = FormData.fromMap(params!);
//
//     // Handle and check all the status.
//     return clientHandle(
//       url,
//       method,
//       params,
//       data: data,
//       onSuccessFunction: onSuccessFunction,
//     );
//   }
//
//   // Normal Rest API  handle.
//   Future request({
//     required String url,
//     required Method method,
//     Map<String, dynamic>? params,
//     bool? isPopGlobalDialog,
//     String? token,
//     Options? options,
//     void Function(int, int)? onReceiveProgress,
//     String? savePath,
//     Map<String, String>? extraHeaders,
//     required Function(Response response) onSuccessFunction,
//   }) async {
//     //use this for extra header
//     final tokenHeader = <String, String>{
//       //  AppConstant.PUSH_ID.key: PrefHelper.getString(AppConstant.DEVICE_ID.key),
//     };
//
//     if (extraHeaders != null) {
//       tokenHeader.addAll(extraHeaders);
//     }
//
//     if (NetworkConnection.instance.isInternet) {
//       // Handle and check all the status.
//       isPopDialog = isPopGlobalDialog;
//       _initDio(extraHeader: tokenHeader);
//       // checkProxy();
//       return clientHandle(
//         url,
//         method,
//         params,
//         options: options,
//         savePath: savePath,
//         onReceiveProgress: onReceiveProgress,
//         onSuccessFunction: onSuccessFunction,
//       );
//     } else {
//       _handleNoInternet(
//         apiParams: APIParams(
//           url: url,
//           method: method,
//           variables: params ?? {},
//           onSuccessFunction: onSuccessFunction,
//         ),
//       );
//     }
//   }
//
// // Handle all the method and error.
//   Future clientHandle(
//     String url,
//     Method method,
//     Map<String, dynamic>? params, {
//     dynamic data,
//     Options? options,
//     String? savePath,
//     void Function(int, int)? onReceiveProgress,
//     required Function(Response response)? onSuccessFunction,
//   }) async {
//     Response response;
//     try {
//       // Handle response code from api.
//       if (method == Method.POST) {
//         response = await _dio.post(
//           url,
//           // queryParameters: params,
//           data: data != null ? data : params,
//         );
//       } else if (method == Method.DELETE) {
//         response = await _dio.delete(url);
//       } else if (method == Method.PATCH) {
//         response = await _dio.patch(url);
//       } else if (method == Method.DOWNLOAD) {
//         response = await _dio.download(
//           url,
//           savePath,
//           queryParameters: params,
//           options: options,
//           onReceiveProgress: onReceiveProgress,
//         );
//       } else {
//         response = await _dio.get(
//           url,
//           queryParameters: params,
//           options: options,
//           onReceiveProgress: onReceiveProgress,
//         );
//       }
//       /**
//        * Handle Rest based on response json
//        * So please check in json body there is any status_code or code
//        */
//       _handleResponse(
//         response: response,
//         onSuccessFunction: onSuccessFunction,
//       );
//
//       // Handle Error type if dio catches anything.
//     } on DioException catch (e) {
//       "Error is: $e".log();
//       _handleDioError(e);
//       rethrow;
//     } catch (e) {
//       "DioErrorCatch :: $e".log();
//       throw Exception("Something went wrong $e");
//     }
//   }
//
//   Map<String, String> _getHeaders() {
//     final DEVISE_OS =
//         Platform.isAndroid ? AppConstant.ANDROID.key : AppConstant.IOS.key;
//
//     Map<String, String> headers = {
//       HttpHeaders.contentTypeHeader: AppConstant.APPLICATION_JSON.key,
//       AppConstant.APP_VERSION.key:
//           PrefHelper.getString(AppConstant.APP_VERSION.key),
//       AppConstant.BUILD_NUMBER.key:
//           PrefHelper.getString(AppConstant.BUILD_NUMBER.key),
//       AppConstant.DEVICE_OS.key: DEVISE_OS,
//       AppConstant.LANGUAGE.key: PrefHelper.getLanguage() == 1
//           ? AppConstant.EN.key
//           : AppConstant.BN.key,
//       AppConstant.DEVICE_ID.key:
//           PrefHelper.getString(AppConstant.DEVICE_ID.key),
//     };
//     String token = PrefHelper.getString(AppConstant.TOKEN.key);
//     if (token.isNotEmpty == true) {
//       Map<String, String> bearerToken = {
//         HttpHeaders.authorizationHeader:
//             "${AppConstant.BEARER.key} ${PrefHelper.getString(AppConstant.TOKEN.key)}",
//       };
//       headers.addAll(bearerToken);
//     }
//
//     return headers;
//   }
//
//   void _handleNoInternet({
//     required APIParams apiParams,
//   }) {
//     NetworkConnection.instance.apiStack.add(apiParams);
//
//     if (ViewUtil.isPresentedDialog == false) {
//       ViewUtil.isPresentedDialog = true;
//       WidgetsBinding.instance.addPostFrameCallback(
//         (_) {
//           ViewUtil.showInternetDialog(
//             onPressed: () {
//               if (NetworkConnection.instance.isInternet == true) {
//                 Navigator.of(Navigation.key.currentState!.overlay!.context,
//                         rootNavigator: true)
//                     .pop();
//                 ViewUtil.isPresentedDialog = false;
//                 for (var element in NetworkConnection.instance.apiStack) {
//                   request(
//                     url: element.url,
//                     method: element.method,
//                     params: element.variables,
//                     onSuccessFunction: element.onSuccessFunction,
//                   );
//                 }
//                 NetworkConnection.instance.apiStack = [];
//               }
//             },
//           );
//         },
//       );
//     }
//   }
//
//   void _handleDioError(DioException error) {
//     switch (error.type) {
//       case DioExceptionType.connectionTimeout:
//         ViewUtil.SSLSnackbar("Time out delay ");
//         break;
//       case DioExceptionType.receiveTimeout:
//         ViewUtil.SSLSnackbar("Server is not responded properly");
//         break;
//       case DioExceptionType.unknown:
//         ViewUtil.SSLSnackbar("Server is not responded properly");
//         break;
//       case DioExceptionType.connectionError:
//         ViewUtil.SSLSnackbar("Connection error");
//         break;
//       case DioExceptionType.cancel:
//         ViewUtil.SSLSnackbar("Connection cancel");
//         break;
//
//       case DioExceptionType.badCertificate:
//         ViewUtil.SSLSnackbar("Incorrect certificate error");
//         break;
//       case DioExceptionType.sendTimeout:
//         ViewUtil.SSLSnackbar("Send timeout error");
//         break;
//       case DioExceptionType.badResponse:
//         final Map data = json.decode(error.response.toString());
//         if (error.response?.statusCode == 502) {
//           ViewUtil.SSLSnackbar("Something went wrong");
//         } else {
//           _tempErrorHandle(data);
//         }
//
//         break;
//
//       default:
//         ViewUtil.SSLSnackbar("Something went wrong");
//         break;
//     }
//   }
//
//   Future<void> _handleResponse({
//     required Response response,
//     required Function(Response response)? onSuccessFunction,
//   }) async {
//     if (response.statusCode == 200) {
//       final Map data = json.decode(response.toString());
//       final verifycode = data['status'];
//       int code = int.tryParse(verifycode.toString()) ?? 0;
//       if (code == 200) {
//         if (response.data != null) {
//           return onSuccessFunction!(response);
//         } else {
//           throw Exception("response data is ${response.data}");
//         }
//       } else if (code == 401) {
//         await PrefHelper.setString(AppConstant.TOKEN.key, "");
//         // Navigation.pushAndRemoveUntil(
//         //   Navigation.key.currentContext,
//         //   appRoutes: AppRoutes.login,
//         //   arguments: LoginRegisterOpenFor.normal,
//         // );
//       } else {
//         //Where error occured then pop the global dialog
//         _tempErrorHandle(data);
//       }
//     }
//   }
//
//   void _tempErrorHandle(dynamic data) async {
//     "data:: $data".log();
//   }
// }

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
  void post(String path, dynamic data,
      Function(Response? data, bool isSuccess) callback) async {
    try {
      Response response = await _dio.post(path, data: data);
      await _processResponse(response, callback);
    } catch (e) {
      await _handleError(e);
      callback(null, false);
    }
  }

  // Function to handle response processing
  Future<void> _processResponse(Response response,
      Function(Response? data, bool isSuccess) callback) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      callback(response.data, true); // Success
    } else {
      final globalResponse = GlobalResponse.fromJson(response.data);
      await ViewUtil.showError(globalResponse.message);
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

    await ViewUtil.showError(errorMessage);
  }
}
