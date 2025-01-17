import 'package:tixe_flutter_app/modules/workout_flow/my_workout_detail/model/my_enrolled_workout_detail_response.dart';

class MyWorkoutDetailState {
  final MyWorkoutData? detail;
  final List<WorkoutPhase> history;

  MyWorkoutDetailState({
    required this.detail,
    required this.history,
  });

  MyWorkoutDetailState copyWith({
    MyWorkoutData? detail,
    List<WorkoutPhase>? history,
  }) {
    return MyWorkoutDetailState(
      detail: detail ?? this.detail,
      history: history ?? this.history,
    );
  }
}
