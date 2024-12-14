import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_chip_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

import '../../../../../utils/styles/k_colors.dart';

class TrainingPriceAndDetails extends StatelessWidget {
  const TrainingPriceAndDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalText(
                  str: "Viper Shooting Range, Ohio",
                  color: KColor.white.color,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 10.h),
                const GlobalChipWidget(title: "\$450"),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 8.h,
                      width: 8.w,
                      decoration: BoxDecoration(
                        color: KColor.green.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Flexible(
                      child: GlobalText(
                        str: context.loc.active_enrolment,
                        color: KColor.white.color,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    GlobalImageLoader(
                      imagePath: KAssetName.starPng.imagePath,
                      height: 11.h,
                      width: 11.w,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Flexible(
                      child: GlobalText(
                        str: "4.5 (12 ${context.loc.reviews})",
                        color: KColor.white.color,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
