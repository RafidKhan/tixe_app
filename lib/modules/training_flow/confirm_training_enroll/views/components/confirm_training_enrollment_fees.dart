import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../../../../../global/widget/global_divider.dart';
import '../../../../../global/widget/global_textformfield.dart';
import '../../../../../utils/styles/k_colors.dart';

class ConfirmTrainingEnrollmentFees extends StatelessWidget {
  const ConfirmTrainingEnrollmentFees({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildRow(context.loc.training_fee, "\$450.00"),
          _buildRow(context.loc.gears_fee, "\$1275.00"),
          _buildRow(context.loc.convenience, "\$20.00"),
          GlobalText(
            str: context.loc.discount_code,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: KColor.grey.color,
          ),
          SizedBox(height: 10.h),
          GlobalTextFormfield(
            //textEditingController: controller.ageController,
            suffixIcon: _applyCodeButton(
              context,
              onTap: () {},
            ),
          ),
          SizedBox(height: 10.h),
          _buildRow(context.loc.discount, "-\$20.00"),
          const GlobalDivider(),
          GlobalText(
            str: context.loc.grand_total,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: KColor.white.color,
          ),
          SizedBox(height: 5.h),
          GlobalText(
            str: "\$1680.00",
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: KColor.white.color,
          ),
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
    required VoidCallback onTap,
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
