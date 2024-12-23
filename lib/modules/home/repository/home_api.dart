import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

import '/data_provider/api_client.dart';

class HomeApi {
  final ApiClient _apiClient = ApiClient();

  HomeApi();

  Future<void> getHomeData({
    required int page,
    required Function(Response? response, bool isSuccess) callback,
  }) async {
    final url = AppUrl.homeData.url.replaceAll(
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
