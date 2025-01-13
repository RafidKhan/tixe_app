import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

import '/data_provider/api_client.dart';
import '../../../../constant/app_url.dart';

class ConfirmTrainingEnrollApi {
  final ApiClient _apiClient = ApiClient();

  ConfirmTrainingEnrollApi();

  Future<void> setTimeSchedule({
    required Map<String, dynamic> params,
    required Function(Response? response, bool isSuccess) callback,
  }) async {
    await _apiClient.request(
      url: AppUrl.setTrainingTimeSchedule.url,
      method: Method.POST,
      params: params,
      callback: callback,
    );
  }

  Future<void> confirmEnrollment({
    required Map<String, dynamic> params,
    required Function(Response? response, bool isSuccess) callback,
  }) async {
    await _apiClient.request(
      url: AppUrl.confirmTrainingEnroll.url,
      method: Method.POST,
      params: params,
      callback: callback,
    );
  }

  Future<void> setTrainingGears({
    required Map<String, dynamic> params,
    required Function(Response? response, bool isSuccess) callback,
  }) async {
    await _apiClient.request(
      url: AppUrl.setTrainingGears.url,
      method: Method.POST,
      params: params,
      callback: callback,
    );
  }

  Future<void> verifyTrainingDiscountCode({
    required String code,
    required int trainingId,
    required Function(Response? data, bool isSuccess) callback,
  }) async {
    await _apiClient.request(
      url: AppUrl.verifyTrainingDiscountCode.url,
      params: {
        "training_service_id": trainingId,
        "discount_code": code,
      },
      method: Method.POST,
      callback: callback,
    );
  }
}
