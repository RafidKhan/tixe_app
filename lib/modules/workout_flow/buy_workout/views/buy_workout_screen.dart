import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/workout_flow/buy_workout/controller/buy_workout_controller.dart';
import 'package:tixe_flutter_app/modules/workout_flow/buy_workout/views/components/buy_workout_header.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/model/workout_detail_response.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../../../../global/widget/global_button.dart';
import 'components/buy_workout_fees.dart';
import 'components/buy_workout_payment_methods.dart';

class BuyWorkoutScreen extends StatefulWidget {
  final WorkoutService model;

  const BuyWorkoutScreen({
    super.key,
    required this.model,
  });

  @override
  State<BuyWorkoutScreen> createState() => _BuyWorkoutScreenState();
}

class _BuyWorkoutScreenState extends State<BuyWorkoutScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(buyWorkoutController.notifier);
    Future(() {
      controller.setModel(widget.model);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read(buyWorkoutController.notifier);

    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const BuyWorkoutHeader(),
          SizedBox(height: 20.h),
          const BuyWorkoutFees(),
          const Spacer(),
          const BuyWorkoutPaymentMethods(),
          GlobalButton(
            margin: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            onPressed: () {
              controller.enrollmentPaidWorkout();
            },
            buttonText: context.loc.confirm_and_pay,
          ),
        ],
      ),
    );
  }
}
