import '../../../my_workout_detail/model/my_enrolled_workout_detail_response.dart';

class MyWorkoutSelectPhaseState {
  final MyWorkoutData? model;

  const MyWorkoutSelectPhaseState({required this.model});

  MyWorkoutSelectPhaseState copyWith({
    MyWorkoutData? model,
  }) {
    return MyWorkoutSelectPhaseState(
      model: model ?? this.model,
    );
  }
}