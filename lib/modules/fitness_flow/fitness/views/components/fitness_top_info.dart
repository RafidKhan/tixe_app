import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class FitnessTopInfo extends StatelessWidget {
  const FitnessTopInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      width: context.width,
      decoration: BoxDecoration(
        color: KColor.shadeGradient1.color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: GlobalImageLoader(
              imagePath: KAssetName.treadMillPng.imagePath,
              height: 188.h,
              width: 180.w,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Column(
              children: [
                _buildRow(
                  KAssetName.icStepsPng.imagePath,
                  "Steps",
                  "1000",
                ),
                _buildRow(
                  KAssetName.icCaloriesPng.imagePath,
                  "Calories",
                  "1000",
                ),
                _buildRow(
                  KAssetName.icExcercisePng.imagePath,
                  "Exercise",
                  "20 min",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String image, String name, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalImageLoader(
            imagePath: image,
            height: 30.h,
            width: 30.w,
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              GlobalText(
                str: name,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: 4.h,
              ),
              GlobalText(
                str: value,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ],
          )
        ],
      ),
    );
  }
}
