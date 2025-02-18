import 'package:health/health.dart';

class SharedState {
  final bool isHealthConnectSynced;
  final String totalSteps;
  final String burntCalories;
  final String exerciseTime;
  final String heartRate;
  final String sleepTime;
  final List<HealthDataPoint> exerciseList;
  final List<HealthDataPoint> pastExerciseList;
  final DateTime pastDateTime;

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
    );
  }
}
