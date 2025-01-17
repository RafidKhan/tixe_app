import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/global/model/global_response.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/model/workout_detail_response.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/model/workout_enrollment_request.dart';

@immutable
abstract class IWorkoutDetailsRepository {
  Future<void> workoutDetails({
    required int id,
    required Function(WorkoutDetailResponse? response, bool isSuccess) callback,
  });

  Future<void> enrollFreeWorkout({
    required WorkoutEnrollmentRequest params,
    required Function(GlobalResponse? response, bool isSuccess) callback,
  });
}
