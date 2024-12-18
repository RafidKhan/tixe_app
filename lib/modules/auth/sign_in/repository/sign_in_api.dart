import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

import '../../../../constant/app_url.dart';

class SignInApi {
  final ApiClient _apiClient = ApiClient();

  SignInApi();

  Future<void> signInUser({
    required String email,
    required String password,
    required Function(Response? data, bool isSuccess) callback,
  }) async {
    await _apiClient.request(
      url: AppUrl.login.url,
      params: {
        "email": email,
        "password": password,
      },
      method: Method.POST,
      callback: callback,
    );
  }
}
