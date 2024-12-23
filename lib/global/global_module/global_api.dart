import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

class GlobalApi {
  final ApiClient _apiClient = ApiClient();

  Future<void> getSettingsData({
    required Function(Response? response, bool isSuccess) callback,
  }) async {
    await _apiClient.request(
      url: AppUrl.settings.url,
      callback: callback,
      method: Method.GET,
    );
  }

  Future<void> performSocialLogin({
    required String email,
    required String name,
    required String client,
    required String token,
    required Function(Response? data, bool isSuccess) callback,
  }) async {
    await _apiClient.request(
      url: AppUrl.socialLogin.url,
      params: {
        "email": email,
        "name": name,
        "client": client,
        "token": token,
      },
      method: Method.POST,
      callback: callback,
    );
  }
}
