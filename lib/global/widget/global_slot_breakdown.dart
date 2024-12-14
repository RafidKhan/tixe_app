import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import 'global_slot_breakdown_container.dart';
import 'global_text.dart';

class GlobalSlotBreakdown extends StatelessWidget {
  const GlobalSlotBreakdown({super.key});

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
            height: 50.h,
            width: 50.w,
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: KColor.liteGrey.color,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: GlobalText(
                str: "SUN",
                color: KColor.white.color,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: GlobalText(
              str: "4:30 PM - 6:30 PM",
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
