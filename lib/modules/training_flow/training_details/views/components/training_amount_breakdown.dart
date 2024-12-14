import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_chip_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../../../global/widget/global_slot_item_widget.dart';

class TrainingAmountBreakdown extends StatelessWidget {
  const TrainingAmountBreakdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          _buildRow(context.loc.training_fee, "\$450.00"),
          _buildRow(context.loc.gears_fee, "\$1275.00"),
          _buildRow(context.loc.convenience, "\$20.00"),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Divider(
              color: KColor.btnGradient1.color,
              thickness: 0.1.h,
            ),
          ),
          SizedBox(height: 20.h),
          GlobalText(
            str: "\$1680.00",
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
          SizedBox(width: 20.w,),
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
