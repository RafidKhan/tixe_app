import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../../../global/widget/global_chip_widget.dart';

class TrainingEnrollmentLocationAndAmount extends StatelessWidget {
  const TrainingEnrollmentLocationAndAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            str: context.loc.training_location,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: KColor.white.color,
          ),
          SizedBox(height: 20.h),
          GlobalImageLoader(
            imagePath: KAssetName.dummyMapLocationPng.imagePath,
            height: 213.h,
            width: context.width,
          ),
          SizedBox(height: 30.h),
          GlobalText(
            str: "Viper Shooting Range, Ohio",
            color: KColor.white.color,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 10.h),
          const GlobalChipWidget(title: "\$450"),
        ],
      ),
    );
  }
}
