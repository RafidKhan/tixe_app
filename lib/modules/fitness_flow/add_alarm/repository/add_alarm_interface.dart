import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/global/model/global_response.dart';

@immutable
abstract class IAddAlarmRepository {
  Future<void> addAlarm({
    required String alarmTime,
    required String type,
    required Function(GlobalResponse? data, bool isSuccess) callback,
  });
}




