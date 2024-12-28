import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_divider.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/training_flow/confirm_training_enroll/model/confirm_training_enrollment_nav_model.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_details/views/components/training_amount_breakdown.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_enrollment/controller/training_enrollment_controller.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_enrollment/views/components/training_enrollment_available_slots.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_enrollment/views/components/training_enrollment_gear_checklist.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_enrollment/views/components/training_enrollment_header.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_enrollment/views/components/training_enrollment_location_and_amount.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';

import '../../../../utils/styles/k_colors.dart';
import '../model/training_enrollment_nav_model.dart';

class TrainingEnrollmentScreen extends StatefulWidget {
  final TrainingEnrollmentNavModel model;

  const TrainingEnrollmentScreen({
    super.key,
    required this.model,
  });

  @override
  State<TrainingEnrollmentScreen> createState() =>
      _TrainingEnrollmentScreenState();
}

class _TrainingEnrollmentScreenState extends State<TrainingEnrollmentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(trainingEnrollmentController.notifier);
    Future(() {
      controller.setModel(widget.model);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const TrainingEnrollmentHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const TrainingEnrollmentAvailableSlots(),
                  SizedBox(height: 20.h),
                  const TrainingEnrollmentLocationAndAmount(),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const GlobalDivider(),
                  ),
                  SizedBox(height: 20.h),
                  const TrainingEnrollmentGearChecklist(),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Divider(
                      color: KColor.btnGradient1.color,
                      thickness: 0.1.h,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  const TrainingAmountBreakdown(),
                  SizedBox(height: 20.h),
                  Consumer(builder: (context, ref, child) {
                    final state = ref.watch(trainingEnrollmentController);

                    return GlobalButton(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 20.h,
                      ),
                      onPressed: state.isButtonEnabled
                          ? () {
                              Navigation.push(
                                appRoutes: AppRoutes.confirmTrainingEnroll,
                                arguments: ConfirmTrainingEnrollmentNavModel(
                                  trainingDetail: state.model?.trainingDetail,
                                  reviewStatistics:
                                      state.model?.reviewStatistics,
                                  gearsFee: "0",
                                  discountAmount: "0",
                                  totalFee: state.totalAmount,
                                  selectedDateBasedSlot:
                                      state.selectedDateBasedSlot,
                                  selectedDurationBasedSlot:
                                      state.selectedDurationBasedSlot,
                                  selectedGears: state.selectedGears,
                                ),
                              );
                            }
                          : null,
                      buttonText: context.loc.confirm_and_pay,
                    );
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
