import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class GlobalSlotItemWidget extends StatelessWidget {
  final bool isSelected;
  final bool showSelectedIcon;
  final VoidCallback onTap;
  final String startDayNumber;
  final String startDayName;
  final String endDayNumber;
  final String endDayName;
  final List<String> dayList;

  const GlobalSlotItemWidget({
    super.key,
    required this.isSelected,
    required this.showSelectedIcon,
    required this.onTap,
    required this.startDayNumber,
    required this.startDayName,
    required this.endDayNumber,
    required this.endDayName,
    required this.dayList,
  });

  @override
  Widget build(BuildContext context) {
    String dayListString = "";
    dayListString = dayListString + dayList.join(" ");
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 90.h,
        decoration: BoxDecoration(
          color: KColor.bodyGradient1.color,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: isSelected
                ? KColor.btnGradient1.color
                : KColor.transparent.color,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
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
                children: [
                  GlobalText(
                    str: startDayNumber,
                    color: KColor.white.color,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  GlobalText(
                    str: startDayName,
                    color: KColor.white.color,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GlobalText(
                  str:
                      "$startDayNumber $startDayName - $endDayNumber $endDayName",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: KColor.white.color,
                ),
                SizedBox(height: 10.h),
                GlobalText(
                  str: dayListString,
                  fontSize: 9,
                  fontWeight: FontWeight.w400,
                  color: KColor.grey.color,
                ),
              ],
            ),
            if (isSelected && showSelectedIcon) ...[
              const Spacer(),
              GlobalImageLoader(
                imagePath: KAssetName.icCheckboxPng.imagePath,
                height: 20.h,
                width: 20.w,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
