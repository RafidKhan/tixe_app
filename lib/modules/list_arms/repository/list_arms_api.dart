import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

import '../../../constant/app_url.dart';
import '/data_provider/api_client.dart';

class ListArmsApi {
  final ApiClient _apiClient = ApiClient();

  ListArmsApi();

  Future<void> getMyArms({
    required Function(Response? response, bool isSuccess) callback,
  }) async {
    await _apiClient.request(
      url: AppUrl.myGears.url,
      method: Method.GET,
      callback: callback,
    );
  }
}
