import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/workout_flow/buy_workout/controller/state/buy_workout_state.dart';

import '../../../../utils/app_routes.dart';
import '../../../../utils/navigation.dart';
import '../../../../utils/view_util.dart';
import '../../workout_details/model/workout_detail_response.dart';
import '../../workout_details/model/workout_enrollment_request.dart';
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


  Future<void> enrollmentPaidWorkout() async {
    ViewUtil.showLoaderPage();
    final params = WorkoutEnrollmentRequest(
      workoutServiceId: state.model?.id,
      paymentId: null,
      trainingFee: num.tryParse(state.model?.enrollmentFee??"0"),
      conveiences: num.tryParse(state.model?.convenienceFee??"0"),
      discountAmount: null,
      grandTotal: num.tryParse(state.totalFee),
    );
    await _buyworkoutRepository.enrollPaidWorkout(
      params: params,
      callback: (response, isSuccess) async {
        ViewUtil.hideLoader();
        final message = response?.message;
        if (message != null) {
          ViewUtil.snackBar(message);
        }
        if (isSuccess) {
          Navigation.pushAndRemoveUntil(appRoutes: AppRoutes.dashboard);
        }
      },
    );
  }
}
