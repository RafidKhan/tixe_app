import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/modules/training_flow/confirm_training_enroll/model/confirm_training_enrollment_request.dart';

import '../../../../global/model/global_response.dart';
import '../model/time_schedule_request.dart';

@immutable
abstract class IConfirmTrainingEnrollRepository {
  Future<void> setTimeSchedule({
    required TimeScheduleRequest params,
    required Function(GlobalResponse? response, bool isSuccess) callback,
  });

  Future<void> confirmEnrollment({
    required ConfirmTrainingEnrollmentRequest params,
    required Function(GlobalResponse? response, bool isSuccess) callback,
  });
}
