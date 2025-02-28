import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/global/model/global_response.dart';

@immutable
abstract class IAddAlarmRepository {
  Future<void> addAlarm({
    required String alarmTime,
    required Function(GlobalResponse? data, bool isSuccess) callback,
  });

  Future<void> deleteAlarm({
    required String id,
    required Function(GlobalResponse? data, bool isSuccess) callback,
  });

  Future<void> updateAlarm({
    required String id,
    required String alarmTime,
    required String date,
    required String type,
    required Function(GlobalResponse? data, bool isSuccess) callback,
  });

  Future<void> disableAlarm({
    required String id,
    required String alarmTime,
    required String date,
    required String type,
    required int isEnabled,
    required Function(GlobalResponse? data, bool isSuccess) callback,
  });
}




