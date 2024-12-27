import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/model/global_slot_breakdown_model.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';
import 'global_text.dart';

class GlobalSlotBreakdown extends StatelessWidget {
  final SlotData slotData;

  const GlobalSlotBreakdown({
    super.key,
    required this.slotData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 16.w,
      ),
      child: Row(
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: KColor.liteGrey.color,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (slotData.date != null)
                  GlobalText(
                    str: slotData.date ?? "",
                    color: KColor.white.color,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                GlobalText(
                  str: slotData.day,
                  color: KColor.white.color,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: GlobalText(
              str: "${slotData.startTime} - ${slotData.endTime}",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: KColor.white.color,
            ),
          ),
        ],
      ),
    );
  }
}
