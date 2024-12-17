import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/global/model/global_response.dart';

import 'verify_email_api.dart';
import 'verify_email_interface.dart';

class VerifyEmailRepository implements IVerifyEmailRepository {
  final _api = VerifyEmailApi();

  @override
  Future<void> verifyRegistrationCode({
    required String email,
    required String code,
    required Function(Response? data, bool isSuccess) callback,
  }) async {
    await _api.verifyRegistrationCode(
      email: email,
      code: code,
      callback: callback,
    );
  }

  @override
  Future<void> resendRegistrationVerificationCode({
    required String email,
    required Function(GlobalResponse? data, bool isSuccess) callback,
  }) async {
    await _api.resendRegistrationVerificationCode(
      email: email,
      callback: (response, isSuccess) {
        callback(
          isSuccess ? GlobalResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }
}
