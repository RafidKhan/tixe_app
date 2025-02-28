import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

import '/data_provider/api_client.dart';

class AddAlarmApi {
  final ApiClient _apiClient = ApiClient();

  AddAlarmApi();

  Future<void> addAlarm({
    required String alarmTime,
    required Function(Response? data, bool isSuccess) callback,
  }) async {
    await _apiClient.request(
      url: AppUrl.alarmStore.url,
      method: Method.POST,
      params: {
        "type": "custom",
        "time": alarmTime,
        "date": DateFormat('dd/M/yyyy').format(DateTime.now()),
        "isEnable": 1,
      },
      callback: callback,
    );
  }

  Future<void> deleteAlarm({
    required String id,
    required Function(Response? data, bool isSuccess) callback,
  }) async {
    await _apiClient.request(
      url: AppUrl.deleteAlarm.url.replaceAll("{ID}", id),
      method: Method.GET,
      callback: callback,
    );
  }
}
