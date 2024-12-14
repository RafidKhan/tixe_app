import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../../utils/styles/k_colors.dart';
import 'global_divider.dart';
import 'global_slot_breakdown.dart';

class GlobalSlotBreakDownContainer extends StatelessWidget {
  const GlobalSlotBreakDownContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      decoration: BoxDecoration(
        color: KColor.darkGrey2.color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: KColor.darkGrey.color,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return const GlobalSlotBreakdown();
          },
          separatorBuilder: (context, index) {
            return const GlobalDivider();
          },
        ),
      ),
    );
  }
}
