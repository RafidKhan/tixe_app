import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

import '/data_provider/api_client.dart';

class TrainingDetailsApi {
  final ApiClient _apiClient = ApiClient();

  TrainingDetailsApi();

  Future<void> trainingDetails({
    required int id,
    required Function(Response? response, bool isSuccess) callback,
  }) async {
    final url = AppUrl.trainingDetails.url.replaceAll("{ID}", id.toString());
    await _apiClient.request(
      url: url,
      method: Method.GET,
      callback: callback,
    );
  }
}
