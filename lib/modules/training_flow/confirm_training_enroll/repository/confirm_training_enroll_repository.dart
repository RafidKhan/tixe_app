import 'package:tixe_flutter_app/modules/training_flow/confirm_training_enroll/model/time_schedule_request.dart';
import 'package:tixe_flutter_app/modules/training_flow/confirm_training_enroll/repository/confirm_training_enroll_api.dart';

import '../../../../global/model/global_response.dart';
import '../model/confirm_training_enrollment_request.dart';
import '../model/confirm_training_gears_request.dart';
import '../model/set_time_schedule_response.dart';
import 'confirm_training_enroll_interface.dart';

class ConfirmTrainingEnrollRepository
    implements IConfirmTrainingEnrollRepository {
  final ConfirmTrainingEnrollApi _api = ConfirmTrainingEnrollApi();

  @override
  Future<void> setTimeSchedule({
    required TimeScheduleRequest params,
    required Function(SetTimeScheduleResponse? response, bool isSuccess) callback,
  }) async {
    await _api.setTimeSchedule(
      params: params.toJson(),
      callback: (response, success) {
        callback(
          success ? SetTimeScheduleResponse.fromJson(response?.data) : null,
          success,
        );
      },
    );
  }

  @override
  Future<void> confirmEnrollment({
    required ConfirmTrainingEnrollmentRequest params,
    required Function(GlobalResponse? response, bool isSuccess) callback,
  }) async {
    await _api.confirmEnrollment(
      params: params.toJson(),
      callback: (response, success) {
        callback(
          success ? GlobalResponse.fromJson(response?.data) : null,
          success,
        );
      },
    );
  }

  @override
  Future<void> setTrainingGears({
    required SetTrainingGearsRequest params,
    required Function(GlobalResponse? response, bool isSuccess) callback,
  }) async {
    await _api.setTrainingGears(
      params: params.toJson(),
      callback: (response, success) {
        callback(
          success ? GlobalResponse.fromJson(response?.data) : null,
          success,
        );
      },
    );
  }
}
