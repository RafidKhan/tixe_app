import 'package:tixe_flutter_app/modules/workout_flow/workout/model/workout_list_response.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout/repository/workout_api.dart';

import '../model/my_workouts_response.dart';
import 'workout_interface.dart';

class WorkoutRepository implements IWorkoutRepository {
  final WorkoutApi _api = WorkoutApi();

  @override
  Future<void> getWorkouts({
    required int page,
    required Function(WorkoutListResponse? response, bool isSuccess) callback,
  }) async {
    await _api.getWorkouts(
      page: page,
      callback: (response, isSuccess) {
        callback(
          isSuccess ? WorkoutListResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }

  @override
  Future<void> getMyWorkouts({
    required int page,
    required Function(MyWorkoutsResponse? response, bool isSuccess) callback,
  }) async {
    await _api.getMyWorkouts(
      page: page,
      callback: (response, isSuccess) {
        callback(
          isSuccess ? MyWorkoutsResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }
}
