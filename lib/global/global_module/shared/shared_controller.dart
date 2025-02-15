import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_state.dart';
import 'package:tixe_flutter_app/utils/user_activity_tracker_services/user_activity_tracker_services.dart';

final sharedController = StateNotifierProvider<SharedController, SharedState>(
  (ref) => SharedController(),
);

class SharedController extends StateNotifier<SharedState> {
  SharedController()
      : super(
          const SharedState(
            isHealthConnectSynced: false,
            totalSteps: "",
            burntCalories: "",
            exerciseTime: "",
            heartRate: "",
            exerciseList: [],
          ),
        );

  void clearData() {
    state = const SharedState(
      isHealthConnectSynced: false,
      totalSteps: "",
      burntCalories: "",
      exerciseTime: "",
      heartRate: "",
      exerciseList: [],
    );
  }

  Future<void> checkIsHealthConnectSynced() async {
    state = state.copyWith(
      isHealthConnectSynced: UserActivityTrack.isSyncedWithTracker(),
    );

    if (state.isHealthConnectSynced) {
      await fetchFitnessData();
    }
  }

  Future<void> fetchFitnessData() async {
    await UserActivityTrack.fetchAllData(
      caloriesResult: (calories) {
        state = state.copyWith(burntCalories: calories.toStringAsFixed(2));
      },
      stepsResult: (steps) {
        state = state.copyWith(totalSteps: steps.round().toString());
      },
      exerciseTimeResult: (time) {
        state = state.copyWith(exerciseTime: time.round().toString());
      },
      heartRateResult: (heartRate) {
        state = state.copyWith(heartRate: heartRate.round().toString());
      },
      exerciseListResult: (exerciseList) {
        state = state.copyWith(exerciseList: exerciseList);
      },
    );
  }
}
