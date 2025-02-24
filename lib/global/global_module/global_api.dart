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

  Future<void> verifyDiscountCode({
    required String code,
    required int id,
    required ServiceType type,
    required Function(Response? data, bool isSuccess) callback,
  }) async {
    final params = {
      "discount_code": code,
    };
    if (type == ServiceType.Training) {
      params["training_service_id"] = id.toString();
    }
    if (type == ServiceType.Workout) {
      params["workout_service_id"] = id.toString();
    }
    await _apiClient.request(
      url: AppUrl.verifyDiscountCode.url,
      params: params,
      method: Method.POST,
      callback: callback,
    );
  }

  Future<void> completeWorkoutPhase({
    required String phaseId,
    required Function(Response? data, bool isSuccess) callback,
  }) async {
    final url = AppUrl.completeWorkoutPhase.url.replaceAll("{ID}", phaseId);

    await _apiClient.request(
      url: url,
      method: Method.GET,
      callback: callback,
    );
  }

  Future<void> fetchAlarms({
    required Function(Response? data, bool isSuccess) callback,
  }) async {
    final url = AppUrl.alarmList.url;
    await _apiClient.request(
      url: url,
      method: Method.GET,
      callback: callback,
    );
  }
}
