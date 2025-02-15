import 'package:health/health.dart';

class SharedState {
  final bool isHealthConnectSynced;
  final String totalSteps;
  final String burntCalories;
  final String exerciseTime;
  final String heartRate;
  final List<HealthDataPoint> exerciseList;

  const SharedState({
    required this.isHealthConnectSynced,
    required this.totalSteps,
    required this.burntCalories,
    required this.exerciseTime,
    required this.heartRate,
    required this.exerciseList,
  });

  SharedState copyWith({
    bool? isHealthConnectSynced,
    String? totalSteps,
    String? burntCalories,
    String? exerciseTime,
    String? heartRate,
    List<HealthDataPoint>? exerciseList,
  }) {
    return SharedState(
      isHealthConnectSynced:
          isHealthConnectSynced ?? this.isHealthConnectSynced,
      totalSteps: totalSteps ?? this.totalSteps,
      burntCalories: burntCalories ?? this.burntCalories,
      exerciseTime: exerciseTime ?? this.exerciseTime,
      heartRate: heartRate ?? this.heartRate,
      exerciseList: exerciseList ?? this.exerciseList,
    );
  }
}
