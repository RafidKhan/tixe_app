import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class ArmStoreGridview extends StatelessWidget {
  const ArmStoreGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 165 / 206,
          crossAxisSpacing: 20.w),
      itemBuilder: (_, index) {
        return _gridItem(
          KAssetName.dummyGearPng.imagePath,
          "AXR325 Night Vision Goggles",
          "275",
        );
      },
      itemCount: 9,
    );
  }

  Widget _gridItem(
    String imagePath,
    String title,
    String price,
  ) {
    final context = Navigation.key.currentContext!;
    final height = 206.h;
    return SizedBox(
      height: height,
      width: context.width,
      child: Column(
        children: [
          Container(
            height: (height / 2.2).h,
            width: context.width,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: KColor.shadeGradient1.color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: GlobalImageLoader(
              imagePath: imagePath,
              fit: BoxFit.contain,
              imageFor: ImageFor.network,
            ),
          ),
          Container(
            height: (height / 2).h,
            width: context.width,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: KColor.shadeGradient2.color,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GlobalText(
                  str: "AXR325 Night Vision Goggles",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    color: KColor.shadeGradient1.color,
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                  child: GlobalText(
                    str: "\$200",
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: KColor.white.color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
