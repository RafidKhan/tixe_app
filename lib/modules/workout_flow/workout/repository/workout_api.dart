import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

import '../../../../constant/app_url.dart';
import '/data_provider/api_client.dart';
class WorkoutApi {
  final ApiClient _apiClient = ApiClient();

  WorkoutApi();

  Future<void> getWorkouts({
    required int page,
    required Function(Response? response, bool isSuccess) callback,
  }) async {
    final url = AppUrl.workouts.url.replaceAll(
      "{PAGE}",
      page.toString(),
    );
    await _apiClient.request(
      url: url,
      method: Method.GET,
      callback: callback,
    );
  }
 
}

