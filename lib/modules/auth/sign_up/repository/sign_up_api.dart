import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';

import '../../../../constant/app_url.dart';

class SignUpApi {
  final ApiClient _apiClient = ApiClient();

  SignUpApi();

  Future<void> signUpUser({
    required String email,
    required String password,
    required String confirmPassword,
    required Function(Response? data, bool isSuccess) callback,
  }) async {
    await _apiClient.post(
      url: AppUrl.registration.url,
      data: {
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
      },
      callback: callback,
    );
  }
}
