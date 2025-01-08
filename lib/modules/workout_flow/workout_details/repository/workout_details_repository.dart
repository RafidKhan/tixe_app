import 'package:tixe_flutter_app/modules/workout_flow/workout_details/model/workout_detail_response.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/repository/workout_details_api.dart';

import 'workout_details_interface.dart';

class WorkoutDetailsRepository implements IWorkoutDetailsRepository {
  final WorkoutDetailsApi _api = WorkoutDetailsApi();

  @override
  Future<void> workoutDetails({
    required int id,
    required Function(WorkoutDetailResponse? response, bool isSuccess) callback,
  }) async {
    await _api.workoutDetails(
      id: id,
      callback: (response, inSuccess) {
        callback(
          inSuccess ? WorkoutDetailResponse.fromJson(response?.data) : null,
          inSuccess,
        );
      },
    );
  }
}
