import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/workout_flow/buy_workout/controller/state/buy_workout_state.dart';

import '../../workout_details/model/workout_detail_response.dart';
import '../repository/buy_workout_interface.dart';
import '../repository/buy_workout_repository.dart';

final buyWorkoutController =
    StateNotifierProvider.autoDispose<BuyWorkoutController, BuyWorkoutState>(
        (ref) => BuyWorkoutController());

class BuyWorkoutController extends StateNotifier<BuyWorkoutState> {
  final IBuyWorkoutRepository _buyworkoutRepository = BuyWorkoutRepository();

  BuyWorkoutController()
      : super(
          const BuyWorkoutState(
            model: null,
            totalFee: "",
          ),
        );

  void setModel(WorkoutService model) {
    state = state.copyWith(model: model);
    calculateTotalAmount();
  }

  void calculateTotalAmount() {
    try {
      final trainingFee = num.parse(state.model?.enrollmentFee ?? "0");
      final convenienceFee = num.parse(state.model?.convenienceFee ?? "0");

      final totalAmount = (trainingFee + convenienceFee).toStringAsFixed(2);
      state = state.copyWith(
        totalFee: totalAmount,
      );
    } catch (e) {
      state = state.copyWith(
        totalFee: "0",
      );
    }
  }
}
