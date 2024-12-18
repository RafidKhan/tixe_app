import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

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
    await _apiClient.request(
      url: AppUrl.registration.url,
      params: {
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
      },
      method: Method.POST,
      callback: callback,
    );
  }
}
