import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../../../../../global/widget/global_divider.dart';
import '../../../../../global/widget/global_textformfield.dart';
import '../../../../../utils/styles/k_colors.dart';
import '../../controller/confirm_training_enroll_controller.dart';

class ConfirmTrainingEnrollmentFees extends ConsumerWidget {
  const ConfirmTrainingEnrollmentFees({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(confirmTrainingEnrollController);
    final controller = ref.read(confirmTrainingEnrollController.notifier);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildRow(context.loc.training_fee,
              "\$${state.model?.trainingDetail?.enrollmentFee ?? "0"}"),
          _buildRow(context.loc.gears_fee, "\$${state.model?.gearsFee ?? "0"}"),
          _buildRow(context.loc.convenience,
              "\$${state.model?.trainingDetail?.conveiencesFee ?? "0"}"),
          GlobalText(
            str: context.loc.discount_code,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: KColor.grey.color,
          ),
          SizedBox(height: 10.h),
          GlobalTextFormfield(
            textEditingController: controller.discountCode,
            suffixIcon: _applyCodeButton(
              context,
              onTap: () {
                controller.verifyTrainingDiscountCode();
              },
            ),
          ),
          SizedBox(height: 10.h),
          if (state.discountValue.trim().isNotEmpty)
            _buildRow(context.loc.discount, "-${state.discountValue}"),
          const GlobalDivider(),
          if (state.totalValue.trim().isNotEmpty) ...[
            GlobalText(
              str: context.loc.grand_total,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: KColor.white.color,
            ),
            SizedBox(height: 5.h),
            GlobalText(
              str: "\$${state.totalValue ?? "0"}",
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: KColor.white.color,
            ),
          ],
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
          GlobalText(
            str: value,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: KColor.white.color,
          ),
        ],
      ),
    );
  }

  Widget _applyCodeButton(
    BuildContext context, {
    required VoidCallback? onTap,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: KColor.btnGradient1.color,
              borderRadius: BorderRadius.circular(3.r),
            ),
            child: Center(
              child: GlobalText(
                str: context.loc.apply_code,
                color: KColor.black.color,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
