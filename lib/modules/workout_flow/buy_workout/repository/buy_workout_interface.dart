import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/global/model/global_response.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/model/workout_enrollment_request.dart';

@immutable
abstract class IBuyWorkoutRepository {
  Future<void> enrollPaidWorkout({
    required WorkoutEnrollmentRequest params,
    required Function(GlobalResponse? response, bool isSuccess) callback,
  });
}




