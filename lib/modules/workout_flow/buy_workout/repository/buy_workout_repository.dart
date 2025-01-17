import 'package:tixe_flutter_app/modules/workout_flow/workout_details/model/workout_enrollment_request.dart';

import '../../../../global/model/global_response.dart';
import 'buy_workout_api.dart';
import 'buy_workout_interface.dart';

class BuyWorkoutRepository implements IBuyWorkoutRepository {
  final BuyWorkoutApi _api = BuyWorkoutApi();

  @override
  Future<void> enrollPaidWorkout({
    required WorkoutEnrollmentRequest params,
    required Function(GlobalResponse? response, bool isSuccess) callback,
  }) async {
    await _api.enrollPaidWorkout(
      params: params.toJson(),
      callback: (response, isSuccess) {
        callback(
          isSuccess ? GlobalResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }
}
