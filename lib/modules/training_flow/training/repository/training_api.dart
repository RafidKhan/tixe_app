import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

import '/data_provider/api_client.dart';
class TrainingApi {
  final ApiClient _apiClient = ApiClient();

  TrainingApi();

  Future<void> getMyTrainings({
    required Function(Response? response, bool isSuccess) callback,
  }) async {
    await _apiClient.request(
      url: AppUrl.myTrainings.url,
      method: Method.GET,
      callback: callback,
    );
  }

  Future<void> getTrainings({
    required Function(Response? response, bool isSuccess) callback,
  }) async {
    await _apiClient.request(
      url: AppUrl.trainingsList.url,
      method: Method.GET,
      callback: callback,
    );
  }

 
}

