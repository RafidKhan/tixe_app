import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class ListArms extends StatelessWidget {
  const ListArms({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      separatorBuilder: (context, index) {
        return SizedBox(height: 20.h);
      },
      itemBuilder: (context, index) {
        return armItem(
          "Arm $index",
          KAssetName.dummyGearPng.imagePath,
        );
      },
    );
  }

  Widget armItem(String title, String image) {
    final context = Navigation.key.currentContext!;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      decoration: BoxDecoration(
        color: KColor.darkGrey.color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            str: title,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 10.h),
          Container(
            width: context.width,
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 30.h,
            ),
            decoration: BoxDecoration(
              color: KColor.darkGrey2.color,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                GlobalImageLoader(
                  imagePath: image,
                  height: 84.h,
                  width: 120.w,
                  //imageFor: ImageFor.network,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
