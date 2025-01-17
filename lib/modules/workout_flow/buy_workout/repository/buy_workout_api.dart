import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

import '/data_provider/api_client.dart';

class BuyWorkoutApi {
  final ApiClient _apiClient = ApiClient();

  BuyWorkoutApi();

  Future<void> enrollPaidWorkout({
    required Map<String, dynamic> params,
    required Function(Response? response, bool isSuccess) callback,
  }) async {
    await _apiClient.request(
      url: AppUrl.paidWorkoutEnrollment.url,
      method: Method.POST,
      params: params,
      callback: callback,
    );
  }
}
