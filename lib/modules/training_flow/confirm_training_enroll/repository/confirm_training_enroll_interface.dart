import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/modules/training_flow/confirm_training_enroll/model/confirm_training_enrollment_request.dart';
import 'package:tixe_flutter_app/modules/training_flow/confirm_training_enroll/model/discount_code_verify_response.dart';

import '../../../../global/model/global_response.dart';
import '../model/confirm_training_gears_request.dart';
import '../model/set_time_schedule_response.dart';
import '../model/time_schedule_request.dart';

@immutable
abstract class IConfirmTrainingEnrollRepository {
  Future<void> setTimeSchedule({
    required TimeScheduleRequest params,
    required Function(SetTimeScheduleResponse? response, bool isSuccess)
        callback,
  });

  Future<void> confirmEnrollment({
    required ConfirmTrainingEnrollmentRequest params,
    required Function(GlobalResponse? response, bool isSuccess) callback,
  });

  Future<void> setTrainingGears({
    required SetTrainingGearsRequest params,
    required Function(GlobalResponse? response, bool isSuccess) callback,
  });
}
