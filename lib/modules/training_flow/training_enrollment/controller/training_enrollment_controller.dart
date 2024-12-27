import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_details/model/training_detail_response.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_enrollment/controller/state/training_enrollment_state.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_enrollment/model/training_enrollment_nav_model.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../repository/training_enrollment_interface.dart';
import '../repository/training_enrollment_repository.dart';

final trainingEnrollmentController = StateNotifierProvider.autoDispose<
    TrainingEnrollmentController,
    TrainingEnrollmentState>((ref) => TrainingEnrollmentController());

class TrainingEnrollmentController
    extends StateNotifier<TrainingEnrollmentState> {
  final ITrainingEnrollmentRepository _trainingenrollmentRepository =
      TrainingEnrollmentRepository();

  TrainingEnrollmentController()
      : super(
          const TrainingEnrollmentState(
            selectedDateBasedSlot: null,
            selectedDurationBasedSlot: null,
            model: null,
            totalAmount: "0",
            isButtonEnabled: false,
          ),
        );

  void setModel(TrainingEnrollmentNavModel model) {
    state = state.copyWith(model: model);
    calculateTotalAmount();
  }

  void selectDateBasedSlot(DateBased dateBased) {
    state = state.copyWith(selectedDateBasedSlot: dateBased);
    checkButtonStatus();
  }

  void selectDurationBasedSlot(DurationBased durationBased) {
    state = state.copyWith(selectedDurationBasedSlot: durationBased);
    checkButtonStatus();
  }

  void checkButtonStatus() {
    state = state.copyWith(
        isButtonEnabled: state.selectedDurationBasedSlot != null ||
            state.selectedDateBasedSlot != null);
  }

  void calculateTotalAmount() {
    try {
      final trainingFee =
          num.parse(state.model?.trainingDetail?.enrollmentFee ?? "0");
      'here is: $trainingFee'.log();
      final convenienceFee =
          num.parse(state.model?.trainingDetail?.conveiencesFee ?? "0");

      final num totalAmount = trainingFee + convenienceFee;
      state = state.copyWith(totalAmount: totalAmount.toString());
    } catch (e) {
      state = state.copyWith(totalAmount: "0");
    }
  }
}
