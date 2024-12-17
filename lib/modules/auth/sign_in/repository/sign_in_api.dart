import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';

import '../../../../constant/app_url.dart';

class SignInApi {
  final ApiClient _apiClient = ApiClient();

  SignInApi();

  Future<void> signInUser({
    required String email,
    required String password,
    required Function(Response? data, bool isSuccess) callback,
  }) async {
    await _apiClient.post(
      url: AppUrl.login.url,
      data: {
        "email": email,
        "password": password,
      },
      callback: callback,
    );
  }
}
