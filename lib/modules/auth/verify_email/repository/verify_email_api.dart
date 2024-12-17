import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';

class VerifyEmailApi {
  final ApiClient _apiClient = ApiClient();

  VerifyEmailApi();

  Future<void> verifyRegistrationCode({
    required String email,
    required String code,
    required Function(Response? data, bool isSuccess) callback,
  }) async {
    await _apiClient.post(
      url: AppUrl.verifyRegistrationCode.url,
      data: {
        "email": email,
        "code": code,
      },
      callback: callback,
    );
  }

  Future<void> resendRegistrationVerificationCode({
    required String email,
    required Function(Response? data, bool isSuccess) callback,
  }) async {
    await _apiClient.post(
      url: AppUrl.resendRegistrationVerificationCode.url,
      data: {
        "email": email,
      },
      callback: callback,
    );
  }
}
