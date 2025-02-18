import 'package:health/health.dart';

class SharedState {
  final bool isHealthConnectSynced;
  final String totalSteps;
  final String burntCalories;
  final String exerciseTime;
  final String heartRate;
  final List<HealthDataPoint> exerciseList;
  final List<HealthDataPoint> pastExerciseList;
  final DateTime pastDateTime;

  const SharedState({
    required this.isHealthConnectSynced,
    required this.totalSteps,
    required this.burntCalories,
    required this.exerciseTime,
    required this.heartRate,
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
      exerciseList: exerciseList ?? this.exerciseList,
      pastExerciseList: pastExerciseList ?? this.pastExerciseList,
      pastDateTime: pastDateTime ?? this.pastDateTime,
    );
  }
}
