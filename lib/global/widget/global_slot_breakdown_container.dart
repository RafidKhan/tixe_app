import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/model/global_slot_breakdown_model.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../../utils/styles/k_colors.dart';
import 'global_divider.dart';
import 'global_slot_breakdown.dart';

class GlobalSlotBreakDownContainer extends StatelessWidget {
  final GlobalSlotBreakdownModel model;

  const GlobalSlotBreakDownContainer({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    if (model.slotDataList.isEmpty) {
      return const SizedBox.shrink();
    }
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
          itemCount: model.slotDataList.length,
          itemBuilder: (context, index) {
            final slotData = model.slotDataList[index];
            return GlobalSlotBreakdown(
              slotData: slotData,
            );
          },
          separatorBuilder: (context, index) {
            return const GlobalDivider();
          },
        ),
      ),
    );
  }
}
