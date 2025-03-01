import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/constant/constant_key.dart';
import 'package:tixe_flutter_app/modules/training_flow/confirm_training_enroll/controller/state/confirm_training_enroll_state.dart';
import 'package:tixe_flutter_app/modules/training_flow/confirm_training_enroll/model/confirm_training_enrollment_request.dart';
import 'package:tixe_flutter_app/modules/training_flow/confirm_training_enroll/model/time_schedule_request.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/mixin/global_mixin.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../../../../global/global_module/global_interface.dart';
import '../../../../global/global_module/global_respository.dart';
import '../../../../utils/enum.dart';
import '../../training_gears_checklist/model/custom_gear_data.dart';
import '../model/confirm_training_enrollment_nav_model.dart';
import '../model/confirm_training_gears_request.dart';
import '../repository/confirm_training_enroll_interface.dart';
import '../repository/confirm_training_enroll_repository.dart';

final confirmTrainingEnrollController = StateNotifierProvider.autoDispose<
    ConfirmTrainingEnrollController,
    ConfirmTrainingEnrollmentState>((ref) => ConfirmTrainingEnrollController());

class ConfirmTrainingEnrollController
    extends StateNotifier<ConfirmTrainingEnrollmentState> with GlobalMixin {
  final IConfirmTrainingEnrollRepository _confirmtrainingenrollRepository =
      ConfirmTrainingEnrollRepository();
  final IGlobalRepository _globalRepository = GlobalRepository();

  final discountCode = TextEditingController();

  ConfirmTrainingEnrollController()
      : super(
          const ConfirmTrainingEnrollmentState(
            model: null,
            totalValue: "0",
            discountValue: "",
          ),
        );

  void setModel(ConfirmTrainingEnrollmentNavModel model) {
    state = state.copyWith(
      model: model,
      totalValue: model.totalFee,
    );
  }

  int enrollmentId = 0;

  Future<void> setTrainingGears() async {
    final details = state.model?.trainingDetail;
    final gears = state.model?.selectedGears ?? [];
    final List<GearRequestData> gearsData = [];

    for (var e in gears) {
      if (e.selection != null && e.selection != GearSelection.GotIt) {
        String buyOrRent = "";
        if (e.selection == GearSelection.Buy) {
          buyOrRent = "buy";
        } else if (e.selection == GearSelection.Rent) {
          buyOrRent = "rent";
        }
        gearsData.add(
          GearRequestData(
            gearsId: e.id,
            buyOrRent: buyOrRent,
          ),
        );
      }
    }

    final params = SetTrainingGearsRequest(
      trainingServiceId: details?.id,
      enrollmentId: enrollmentId,
      data: gearsData,
    );

    ViewUtil.showLoaderPage();
    await _confirmtrainingenrollRepository.setTrainingGears(
      params: params,
      callback: (response, isSuccess) {
        ViewUtil.hideLoader();
        if (isSuccess) {
          Future.delayed(const Duration(milliseconds: 200), () {
            confirmEnrollment();
          });
        }
      },
    );
  }

  Future<void> setTimeSchedule() async {
    final details = state.model?.trainingDetail;
    final type = (details?.scheduleType ?? '').getScheduleType();

    String? startDate;
    String? endDate;
    List<ConfirmDate>? dates;
    if (type == ScheduleType.DateBased) {
      startDate = state.model?.selectedDateBasedSlot?.startDate;
      endDate = state.model?.selectedDateBasedSlot?.endDate;
      dates = List<ConfirmDate>.generate(
          state.model?.selectedDateBasedSlot?.dates?.length ?? 0, (index) {
        final data = state.model?.selectedDateBasedSlot?.dates?[index];
        return ConfirmDate(
          date: data?.date,
          startAt: data?.startAt,
          endAt: data?.endAt,
        );
      });
    }

    if (type == ScheduleType.DurationBased) {
      startDate = state.model?.selectedDurationBasedSlot?.startDate;
      endDate = state.model?.selectedDurationBasedSlot?.endDate;
      dates = List<ConfirmDate>.generate(
          state.model?.selectedDurationBasedSlot?.days?.length ?? 0, (index) {
        final data = state.model?.selectedDurationBasedSlot?.days?[index];
        return ConfirmDate(
          date: data?.day,
          startAt: data?.startAt,
          endAt: data?.endAt,
        );
      });
    }

    final params = TimeScheduleRequest(
      trainingServiceId: details?.id,
      timeSchedule:
          TimeSchedule(startDate: startDate, endDate: endDate, dates: dates),
      scheduleType: details?.scheduleType,
    );

    ViewUtil.showLoaderPage();
    await _confirmtrainingenrollRepository.setTimeSchedule(
      params: params,
      callback: (response, isSuccess) {
        ViewUtil.hideLoader();
        if (isSuccess) {
          enrollmentId = response?.data?.id ?? 0;
          Future.delayed(const Duration(milliseconds: 200), () {
            setTrainingGears();
          });
        }
      },
    );
  }

  Future<void> confirmEnrollment() async {
    final details = state.model?.trainingDetail;

    ViewUtil.showLoaderPage();
    await _confirmtrainingenrollRepository.confirmEnrollment(
      params: ConfirmTrainingEnrollmentRequest(
        enrollmentId: enrollmentId,
        trainingFee: num.tryParse(details?.enrollmentFee ?? "0"),
        gearsCost: num.tryParse(state.model?.gearsFee ?? "0"),
        conveiences: num.tryParse(details?.conveiencesFee ?? "0"),
        discountAmount: num.tryParse(state.discountValue),
        grandTotal: num.tryParse(state.totalValue),
      ),
      callback: (response, isSuccess) {
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

  Future<void> verifyTrainingDiscountCode() async {
    if (state.model?.trainingDetail?.id != null &&
        discountCode.text.trim().isNotEmpty) {
      ViewUtil.showLoaderPage();
      await _globalRepository.verifyDiscountCode(
        code: discountCode.text.trim(),
        id: state.model?.trainingDetail?.id ?? 0,
        type: ServiceType.Training,
        callback: (response, isSuccess) {
          ViewUtil.hideLoader();
          if (isSuccess) {
            discountCode.clear();
            final calculatedAmount = calculateDiscount(
              mainAmount: state.totalValue,
              discountType: response?.data?.discountType ?? "",
              discountValue: response?.data?.discountAmount ?? "0",
            );
            String discountType = response?.data?.discountType ?? "";
            String discountAmount = response?.data?.discountAmount ?? "";
            state = state.copyWith(
              totalValue: calculatedAmount,
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
