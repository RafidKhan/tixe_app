import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/add_alarm/repository/add_alarm_api.dart';

import '../../../../global/model/global_response.dart';
import 'add_alarm_interface.dart';

class AddAlarmRepository implements IAddAlarmRepository {
  final AddAlarmApi _api = AddAlarmApi();

  @override
  Future<void> addAlarm({
    required String alarmTime,
    required String type,
    required Function(GlobalResponse? data, bool isSuccess) callback,
  }) async {
    await _api.addAlarm(
      alarmTime: alarmTime,
      type: type,
      callback: (response, isSuccess) {
        callback(
          isSuccess ? GlobalResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }
}
