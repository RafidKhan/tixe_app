import 'package:tixe_flutter_app/modules/workout_flow/workout_details/model/workout_detail_response.dart';

class BuyWorkoutState {
  final WorkoutService? model;
  final String totalFee;
  final String discountValue;

  const BuyWorkoutState({
    required this.model,
    required this.totalFee,
    required this.discountValue,
  });

  BuyWorkoutState copyWith({
    WorkoutService? model,
    String? totalFee,
    String? discountValue,
  }) {
    return BuyWorkoutState(
      model: model ?? this.model,
      totalFee: totalFee ?? this.totalFee,
      discountValue: discountValue ?? this.discountValue,
    );
  }
}
