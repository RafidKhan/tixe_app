import 'package:tixe_flutter_app/modules/workout_flow/workout/controller/state/workout_state.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/model/workout_detail_response.dart';

class BuyWorkoutState {
  final WorkoutService? model;
  final String totalFee;

  const BuyWorkoutState({
    required this.model,
    required this.totalFee,
  });

  BuyWorkoutState copyWith({
    WorkoutService? model,
    String? totalFee,
  }) {
    return BuyWorkoutState(
      model: model ?? this.model,
      totalFee: totalFee ?? this.totalFee,
    );
  }
}
