import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

import '/data_provider/api_client.dart';

class ListArmsFormApi {
  final ApiClient _apiClient = ApiClient();

  ListArmsFormApi();

  Future<void> getArmsCategories({
    required Function(Response? response, bool isSuccess) callback,
  }) async {
    await _apiClient.request(
      url: AppUrl.armsCategories.url,
      method: Method.GET,
      callback: callback,
    );
  }
}
