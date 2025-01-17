import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout/model/workout_list_response.dart';

import '../model/my_workouts_response.dart';

@immutable
abstract class IWorkoutRepository {
  Future<void> getWorkouts({
    required int page,
    required Function(WorkoutListResponse? response, bool isSuccess) callback,
  });

  Future<void> getMyWorkouts({
    required int page,
    required Function(MyWorkoutsResponse? response, bool isSuccess) callback,
  });
}
