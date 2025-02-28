import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_state.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/user_activity_tracker_services/user_activity_tracker_services.dart';

import '../global_interface.dart';
import '../global_respository.dart';

final sharedController = StateNotifierProvider<SharedController, SharedState>(
  (ref) => SharedController(),
);

class SharedController extends StateNotifier<SharedState> {
  final IGlobalRepository _globalRepository = GlobalRepository();

  SharedController()
      : super(
          SharedState(
            loadingAlarms: false,
            isHealthConnectSynced: false,
            totalSteps: "",
            burntCalories: "",
            exerciseTime: "",
            heartRate: "",
            sleepTime: "",
            exerciseList: [],
            pastExerciseList: [],
            weeklySleep: [],
            alarms: [],
            morningAlarm: null,
            nightAlarm: null,
            pastDateTime: DateTime.now().subtract(
              const Duration(days: 1),
            ),
            profileData: null,
          ),
        );

  void clearData() {
    state = state.removeFitnessData();
  }

  Future<void> checkIsHealthConnectSynced() async {
    state = state.copyWith(
      isHealthConnectSynced: UserActivityTrack.isSyncedWithTracker(),
    );

    if (state.isHealthConnectSynced) {
      await fetchFitnessData();
      await fetchWeeklySleepData();
      await fetchAlarms();
    }
  }

  Future<void> fetchWeeklySleepData() async {
    final List<num> weeklySleep = [];
    List<DateTime> lastSevenDays = List.generate(7, (index) {
      return DateTime.now().subtract(Duration(days: 6 - index));
    });
    lastSevenDays.forEach((e) async {
      await UserActivityTrack.fetchSleepData(
          dateTime: e,
          result: (value) {
            weeklySleep.add(value / 60);
          });
      if (weeklySleep.length == 7) {
        state = state.copyWith(weeklySleep: weeklySleep);
      }
    });
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
      sleepResult: (sleepTime) {
        state = state.copyWith(sleepTime: sleepTime.toString());
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
      sleepResult: (sleepTime) {
        //
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

  Future<void> fetchAlarms() async {
    state = state.copyWith(loadingAlarms: true);
    await _globalRepository.fetchAlarms(
      callback: (response, success) {
        state = state.copyWith(
          loadingAlarms: false,
          alarms: (response?.data ?? [])
              .where((e) => e.alarmType == AlarmType.CUSTOM)
              .toList(),
          morningAlarm: (response?.data ?? [])
              .where((e) => e.alarmType == AlarmType.MORNING)
              .toList()
              .firstOrNull,
          nightAlarm: (response?.data ?? [])
              .where((e) => e.alarmType == AlarmType.NIGHT)
              .toList()
              .firstOrNull,
        );
      },
    );
  }

  Future<void> getProfileData() async {
    state = state.removeProfileData();
    await _globalRepository.getProfileData(callback: (response, success) {
      state = state.copyWith(profileData: response);
    });
  }
}
