import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

import '../../../../../global/widget/global_text.dart';
import '../../../../../utils/styles/k_colors.dart';

class WorkoutHistoryItem extends StatelessWidget {
  final String date;
  final String day;
  final String title;
  final String duration;
  final String calorie;

  const WorkoutHistoryItem({
    super.key,
    required this.date,
    required this.day,
    required this.title,
    required this.duration,
    required this.calorie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 90.h,
      //margin: margin,
      decoration: BoxDecoration(
        color: KColor.darkGrey.color,
        borderRadius: BorderRadius.circular(10.r),
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
                  str: date,
                  color: KColor.white.color,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                GlobalText(
                  str: day,
                  color: KColor.white.color,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GlobalText(
                  str: title,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: KColor.white.color,
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    GlobalImageLoader(
                      imagePath: KAssetName.icClockPng.imagePath,
                      height: 10.h,
                      width: 10.w,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    GlobalText(
                      str: "$duration ${context.loc.minute}",
                      color: KColor.white.color,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    GlobalImageLoader(
                      imagePath: KAssetName.icFirePng.imagePath,
                      height: 10.h,
                      width: 10.w,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    GlobalText(
                      str: "$calorie ${context.loc.kcal}",
                      color: KColor.white.color,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
