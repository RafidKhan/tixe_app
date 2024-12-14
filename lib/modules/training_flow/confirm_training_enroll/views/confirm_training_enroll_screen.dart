import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/training_flow/confirm_training_enroll/views/components/confirm_training_payment_methods.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import 'components/confirm_training_enrollment_fees.dart';
import 'components/confirm_training_enrollment_header.dart';

class ConfirmTrainingEnrollScreen extends StatelessWidget {
  const ConfirmTrainingEnrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const ConfirmTrainingEnrollmentHeader(),
          SizedBox(height: 20.h),
          const ConfirmTrainingEnrollmentFees(),
          const Spacer(),
          const ConfirmTrainingPaymentMethods(),
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
    );
  }
}
