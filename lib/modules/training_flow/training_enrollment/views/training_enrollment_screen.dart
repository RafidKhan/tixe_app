import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_details/views/components/training_amount_breakdown.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_enrollment/views/components/training_enrollment_available_slots.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_enrollment/views/components/training_enrollment_gear_checklist.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_enrollment/views/components/training_enrollment_header.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_enrollment/views/components/training_enrollment_location_and_amount.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../../../../utils/styles/k_colors.dart';

class TrainingEnrollmentScreen extends StatelessWidget {
  const TrainingEnrollmentScreen({super.key});

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
                    child: Divider(
                      color: KColor.btnGradient1.color,
                      thickness: 0.1.h,
                    ),
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
                  GlobalButton(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    onPressed: () {},
                    buttonText: context.loc.confirm_and_pay,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
