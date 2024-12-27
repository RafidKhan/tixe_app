import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

import '/data_provider/api_client.dart';

class TrainingGearsChecklistApi {
  final ApiClient _apiClient = ApiClient();

  TrainingGearsChecklistApi();

  Future<void> getGears({
    required Function(Response? response, bool isSuccess) callback,
  }) async {
    await _apiClient.request(
      url: AppUrl.gears.url,
      method: Method.GET,
      callback: callback,
    );
  }
}
