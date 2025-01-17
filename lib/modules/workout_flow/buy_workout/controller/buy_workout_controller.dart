import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/workout_flow/buy_workout/controller/state/buy_workout_state.dart';
import 'package:tixe_flutter_app/utils/mixin/global_mixin.dart';

import '../../../../constant/constant_key.dart';
import '../../../../global/global_module/global_interface.dart';
import '../../../../global/global_module/global_respository.dart';
import '../../../../utils/app_routes.dart';
import '../../../../utils/enum.dart';
import '../../../../utils/navigation.dart';
import '../../../../utils/view_util.dart';
import '../../workout_details/model/workout_detail_response.dart';
import '../../workout_details/model/workout_enrollment_request.dart';
import '../../workout_details/repository/workout_details_interface.dart';
import '../../workout_details/repository/workout_details_repository.dart';
import '../repository/buy_workout_interface.dart';
import '../repository/buy_workout_repository.dart';

final buyWorkoutController =
    StateNotifierProvider.autoDispose<BuyWorkoutController, BuyWorkoutState>(
        (ref) => BuyWorkoutController());

class BuyWorkoutController extends StateNotifier<BuyWorkoutState>
    with GlobalMixin {
  final IBuyWorkoutRepository _buyworkoutRepository = BuyWorkoutRepository();

  final IWorkoutDetailsRepository _workoutRepository =
      WorkoutDetailsRepository();

  final IGlobalRepository _globalRepository = GlobalRepository();

  final discountCode = TextEditingController();

  BuyWorkoutController()
      : super(
          const BuyWorkoutState(
            model: null,
            totalFee: "",
            discountValue: "",
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
      trainingFee: num.tryParse(state.model?.enrollmentFee ?? "0"),
      conveiences: num.tryParse(state.model?.convenienceFee ?? "0"),
      discountAmount: null,
      grandTotal: num.tryParse(state.totalFee),
    );
    await _workoutRepository.enrollFreeWorkout(
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

  Future<void> verifyWorkoutDiscountCode() async {
    if (state.model?.id != null && discountCode.text.trim().isNotEmpty) {
      ViewUtil.showLoaderPage();
      await _globalRepository.verifyDiscountCode(
        code: discountCode.text.trim(),
        id: state.model?.id ?? 0,
        type: ServiceType.Workout,
        callback: (response, isSuccess) {
          ViewUtil.hideLoader();
          if (isSuccess) {
            discountCode.clear();
            final calculatedAmount = calculateDiscount(
              mainAmount: state.totalFee,
              discountType: response?.data?.discountType ?? "",
              discountValue: response?.data?.discountAmount ?? "0",
            );
            String discountType = response?.data?.discountType ?? "";
            String discountAmount = response?.data?.discountAmount ?? "";
            state = state.copyWith(
              totalFee: calculatedAmount,
              discountValue: discountType == AppConstant.FLAT_DISCOUNT.key
                  ? "\$$discountAmount"
                  : "$discountAmount%",
            );
          }
        },
      );
    }
  }
}
