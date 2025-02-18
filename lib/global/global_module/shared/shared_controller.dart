import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_state.dart';
import 'package:tixe_flutter_app/utils/user_activity_tracker_services/user_activity_tracker_services.dart';

final sharedController = StateNotifierProvider<SharedController, SharedState>(
  (ref) => SharedController(),
);

class SharedController extends StateNotifier<SharedState> {
  SharedController()
      : super(
          SharedState(
            isHealthConnectSynced: false,
            totalSteps: "",
            burntCalories: "",
            exerciseTime: "",
            heartRate: "",
            exerciseList: [],
            pastExerciseList: [],
            pastDateTime: DateTime.now().subtract(
              const Duration(days: 1),
            ),
          ),
        );

  void clearData() {
    state = SharedState(
      isHealthConnectSynced: false,
      totalSteps: "",
      burntCalories: "",
      exerciseTime: "",
      heartRate: "",
      exerciseList: [],
      pastExerciseList: [],
      pastDateTime: DateTime.now().subtract(
        const Duration(days: 1),
      ),
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

  Future<void> fetchFitnessDataByDate() async {
    final fromDate = DateTime(state.pastDateTime.year, state.pastDateTime.month,
        state.pastDateTime.day, 0, 0, 0 // 12:00 AM
        );

    final toDate = DateTime(state.pastDateTime.year, state.pastDateTime.month,
        state.pastDateTime.day, 23, 59, 59 // 11:59 PM
        );
    await UserActivityTrack.fetchAllData(
      startDateTimeValue: fromDate,
      endDateTimeValue: toDate,
      caloriesResult: (calories) {
        //
      },
      stepsResult: (steps) {
        //
      },
      exerciseTimeResult: (time) {
        //
      },
      heartRateResult: (heartRate) {
        //
      },
      exerciseListResult: (exerciseList) {
        state = state.copyWith(pastExerciseList: exerciseList);
      },
    );
  }

  void getPastDayData() {
    state = state.copyWith(
      pastDateTime: state.pastDateTime.subtract(const Duration(days: 1)),
    );
    fetchFitnessDataByDate();
  }

  void getNextDayData() {
    state = state.copyWith(
      pastDateTime: state.pastDateTime.add(const Duration(days: 1)),
    );
    fetchFitnessDataByDate();
  }

  void setDate(DateTime date) {
    state = state.copyWith(pastDateTime: date);
    fetchFitnessDataByDate();
  }
}
