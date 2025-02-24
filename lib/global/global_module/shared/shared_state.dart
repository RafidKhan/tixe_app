import 'package:health/health.dart';
import 'package:tixe_flutter_app/global/model/alarm_list_response.dart';

class SharedState {
  final bool isHealthConnectSynced;
  final String totalSteps;
  final String burntCalories;
  final String exerciseTime;
  final String heartRate;
  final String sleepTime;
  final List<HealthDataPoint> exerciseList;
  final List<HealthDataPoint> pastExerciseList;
  final List<num> weeklySleep;
  final List<AlarmData> alarms;
  final AlarmData? morningAlarm;
  final AlarmData? nightAlarm;
  final DateTime pastDateTime;
  final bool loadingAlarms;

  const SharedState({
    required this.isHealthConnectSynced,
    required this.totalSteps,
    required this.burntCalories,
    required this.exerciseTime,
    required this.heartRate,
    required this.sleepTime,
    required this.exerciseList,
    required this.pastExerciseList,
    required this.pastDateTime,
    required this.weeklySleep,
    required this.loadingAlarms,
    required this.alarms,
    required this.morningAlarm,
    required this.nightAlarm,
  });

  SharedState copyWith({
    bool? isHealthConnectSynced,
    String? totalSteps,
    String? burntCalories,
    String? exerciseTime,
    String? heartRate,
    String? sleepTime,
    List<HealthDataPoint>? exerciseList,
    List<HealthDataPoint>? pastExerciseList,
    DateTime? pastDateTime,
    List<num>? weeklySleep,
    bool? loadingAlarms,
    List<AlarmData>? alarms,
    AlarmData? morningAlarm,
    AlarmData? nightAlarm,
  }) {
    return SharedState(
      isHealthConnectSynced:
          isHealthConnectSynced ?? this.isHealthConnectSynced,
      totalSteps: totalSteps ?? this.totalSteps,
      burntCalories: burntCalories ?? this.burntCalories,
      exerciseTime: exerciseTime ?? this.exerciseTime,
      heartRate: heartRate ?? this.heartRate,
      sleepTime: sleepTime ?? this.sleepTime,
      exerciseList: exerciseList ?? this.exerciseList,
      pastExerciseList: pastExerciseList ?? this.pastExerciseList,
      pastDateTime: pastDateTime ?? this.pastDateTime,
      weeklySleep: weeklySleep ?? this.weeklySleep,
      loadingAlarms: loadingAlarms ?? this.loadingAlarms,
      alarms: alarms ?? this.alarms,
      morningAlarm: morningAlarm ?? this.morningAlarm,
      nightAlarm: nightAlarm ?? this.nightAlarm,
    );
  }
}
