import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_details/model/training_detail_response.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_enrollment/controller/state/training_enrollment_state.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_enrollment/model/training_enrollment_nav_model.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_gears_checklist/model/custom_gear_data.dart';

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
            totalGearAmount: "0",
            isButtonEnabled: false,
            selectedGears: [],
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
        isButtonEnabled: (state.selectedDurationBasedSlot != null ||
                state.selectedDateBasedSlot != null) &&
            state.selectedGears.isNotEmpty);
  }

  void calculateTotalAmount() {
    try {
      final trainingFee =
          num.parse(state.model?.trainingDetail?.enrollmentFee ?? "0");
      final convenienceFee =
          num.parse(state.model?.trainingDetail?.conveiencesFee ?? "0");
      num gearPrice = 0;
      if (state.selectedGears.isNotEmpty) {
        for (var e in state.selectedGears) {
          if (e.selection == GearSelection.Buy) {
            gearPrice += num.parse(e.buyingPrice ?? "0");
          }

          if (e.selection == GearSelection.Rent) {
            gearPrice += num.parse(e.rentPrice ?? "0");
          }

          if (e.selection == GearSelection.GotIt) {
            gearPrice += 0;
          }
        }
      }

      final totalAmount =
          (trainingFee + convenienceFee + gearPrice).toStringAsFixed(2);
      state = state.copyWith(
        totalAmount: totalAmount,
        totalGearAmount: gearPrice.toStringAsFixed(2),
      );
    } catch (e) {
      state = state.copyWith(
        totalAmount: "0",
        totalGearAmount: "0",
      );
    }
  }

  void setSelectedGears(List<CustomGearData> gears) {
    state = state.copyWith(selectedGears: gears);
    calculateTotalAmount();
    checkButtonStatus();
  }
}
