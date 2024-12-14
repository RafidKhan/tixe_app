import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class GlobalSlotItemWidget extends StatelessWidget {
  final bool isSelected;
  final bool showSelectedIcon;

  const GlobalSlotItemWidget({
    super.key,
    required this.isSelected,
    required this.showSelectedIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      decoration: BoxDecoration(
        color: KColor.bodyGradient1.color,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color:
              isSelected ? KColor.btnGradient1.color : KColor.transparent.color,
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
                  str: "03",
                  color: KColor.white.color,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                GlobalText(
                  str: "SEP",
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
                str: "03 Sep - 10 Sep",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: KColor.white.color,
              ),
              SizedBox(height: 10.h),
              GlobalText(
                str: "SUN MON TUE",
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
    );
  }
}
