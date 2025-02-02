import 'package:dio/dio.dart';

import '/data_provider/api_client.dart';
import '../../../../constant/app_url.dart';
import '../../../../utils/enum.dart';
class MyWorkoutDetailApi {
  final ApiClient _apiClient = ApiClient();

  MyWorkoutDetailApi();

  Future<void> getMyWorkoutDetail({
    required int id,
    required Function(Response? response, bool isSuccess) callback,
  }) async {
    final url = AppUrl.myWorkoutDetails.url.replaceAll("{ID}", id.toString());
    await _apiClient.request(
      url: url,
      method: Method.GET,
      callback: callback,
    );
  }

 
}

