import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

import '/data_provider/api_client.dart';

class PreferencesApi {
  final ApiClient _apiClient = ApiClient();

  PreferencesApi();

  Future<void> savePreference({
    required Map<String, dynamic> params,
    required Function(Response? data, bool isSuccess) callback,
  }) async {
    await _apiClient.request(
      url: AppUrl.savePreference.url,
      method: Method.POST,
      params: params,
      callback: callback,
    );
  }
}
