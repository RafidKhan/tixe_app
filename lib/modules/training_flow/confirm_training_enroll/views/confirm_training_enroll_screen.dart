import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/training_flow/confirm_training_enroll/controller/confirm_training_enroll_controller.dart';
import 'package:tixe_flutter_app/modules/training_flow/confirm_training_enroll/views/components/confirm_training_payment_methods.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../model/confirm_training_enrollment_nav_model.dart';
import 'components/confirm_training_enrollment_fees.dart';
import 'components/confirm_training_enrollment_header.dart';

class ConfirmTrainingEnrollScreen extends StatefulWidget {
  final ConfirmTrainingEnrollmentNavModel model;

  const ConfirmTrainingEnrollScreen({
    super.key,
    required this.model,
  });

  @override
  State<ConfirmTrainingEnrollScreen> createState() =>
      _ConfirmTrainingEnrollScreenState();
}

class _ConfirmTrainingEnrollScreenState
    extends State<ConfirmTrainingEnrollScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(confirmTrainingEnrollController.notifier);

    Future(() {
      controller.setModel(widget.model);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read(confirmTrainingEnrollController.notifier);

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
            onPressed: () {
              controller.setTimeSchedule(context);
            },
            buttonText: context.loc.confirm_and_pay,
          ),
        ],
      ),
    );
  }
}
