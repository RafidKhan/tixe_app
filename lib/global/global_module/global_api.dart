import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';

class GlobalApi {
  final ApiClient _apiClient = ApiClient();

  Future<void> getSettingsData({
    required Function(Response? response, bool isSuccess) callback,
  }) async {
    await _apiClient.get(
      url: AppUrl.settings.url,
      callback: callback,
    );
  }
}
