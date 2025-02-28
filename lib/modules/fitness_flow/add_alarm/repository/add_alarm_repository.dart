import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/add_alarm/repository/add_alarm_api.dart';

import '../../../../global/model/global_response.dart';
import 'add_alarm_interface.dart';

class AddAlarmRepository implements IAddAlarmRepository {
  final AddAlarmApi _api = AddAlarmApi();

  @override
  Future<void> addAlarm({
    required String alarmTime,
    required Function(GlobalResponse? data, bool isSuccess) callback,
  }) async {
    await _api.addAlarm(
      alarmTime: alarmTime,
      callback: (response, isSuccess) {
        callback(
          isSuccess ? GlobalResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }

  @override
  Future<void> deleteAlarm({
    required String id,
    required Function(GlobalResponse? data, bool isSuccess) callback,
  }) async {
    await _api.deleteAlarm(
      id: id,
      callback: (response, isSuccess) {
        callback(
          isSuccess ? GlobalResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }

  @override
  Future<void> updateAlarm({
    required String id,
    required String alarmTime,
    required String date,
    required String type,
    required Function(GlobalResponse? data, bool isSuccess) callback,
  }) async {
    await _api.updateAlarm(
      id: id,
      alarmTime: alarmTime,
      type: type,
      date: date,
      callback: (response, isSuccess) {
        callback(
          isSuccess ? GlobalResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }

  @override
  Future<void> disableAlarm({
    required String id,
    required String alarmTime,
    required String date,
    required String type,
    required int isEnabled,
    required Function(GlobalResponse? data, bool isSuccess) callback,
  }) async{
    await _api.disableAlarm(
      id: id,
      alarmTime: alarmTime,
      type: type,
      date: date,
      isEnabled: isEnabled,
      callback: (response, isSuccess) {
        callback(
          isSuccess ? GlobalResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }
}
