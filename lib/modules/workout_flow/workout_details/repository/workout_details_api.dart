import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

import '/data_provider/api_client.dart';

class WorkoutDetailsApi {
  final ApiClient _apiClient = ApiClient();

  WorkoutDetailsApi();

  Future<void> workoutDetails({
    required int id,
    required Function(Response? response, bool isSuccess) callback,
  }) async {
    final url = AppUrl.workoutDetails.url.replaceAll("{ID}", id.toString());
    await _apiClient.request(
      url: url,
      method: Method.GET,
      callback: callback,
    );
  }

  Future<void> enrollFreeWorkout({
    required Map<String, dynamic> params,
    required Function(Response? response, bool isSuccess) callback,
  }) async {
    await _apiClient.request(
      url: AppUrl.freeWorkoutEnrollment.url,
      method: Method.POST,
      params: params,
      callback: callback,
    );
  }
}
