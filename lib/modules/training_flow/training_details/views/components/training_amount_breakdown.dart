import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_chip_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_divider.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_enrollment/controller/training_enrollment_controller.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class TrainingAmountBreakdown extends ConsumerWidget {
  const TrainingAmountBreakdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(trainingEnrollmentController);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          _buildRow(
            context.loc.training_fee,
            "\$${state.model?.trainingDetail?.enrollmentFee ?? "0"}",
          ),
          _buildRow(
            context.loc.gears_fee,
            "\$0",
          ),
          _buildRow(
            context.loc.convenience,
            "\$${state.model?.trainingDetail?.conveiencesFee ?? "0"}",
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: const GlobalDivider(),
          ),
          SizedBox(height: 20.h),
          GlobalText(
            str: "\$${state.totalAmount}",
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: KColor.white.color,
          )
        ],
      ),
    );
  }

  Widget _buildRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: GlobalText(
              str: title,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: KColor.white.color,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: GlobalChipWidget(
              title: value,
            ),
          ),
        ],
      ),
    );
  }
}
