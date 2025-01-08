import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout/model/workout_list_response.dart';

@immutable
abstract class IWorkoutRepository {
  Future<void> getWorkouts({
    required int page,
    required Function(WorkoutListResponse? response, bool isSuccess) callback,
  });
}
