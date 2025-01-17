import 'package:tixe_flutter_app/modules/workout_flow/my_workout_detail/controller/state/my_workout_detail_state.dart';

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