import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';

import '../../../../utils/enum.dart';

class VerifyEmailApi {
  final ApiClient _apiClient = ApiClient();

  VerifyEmailApi();

  Future<void> verifyRegistrationCode({
    required String email,
    required String code,
    required Function(Response? data, bool isSuccess) callback,
  }) async {
    await _apiClient.request(
      url: AppUrl.verifyRegistrationCode.url,
      params: {
        "email": email,
        "code": code,
      },
      method: Method.POST,
      callback: callback,
    );
  }

  Future<void> resendRegistrationVerificationCode({
    required String email,
    required Function(Response? data, bool isSuccess) callback,
  }) async {
    await _apiClient.request(
      url: AppUrl.resendRegistrationVerificationCode.url,
      params: {
        "email": email,
      },
      method: Method.POST,
      callback: callback,
    );
  }
}
