import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_app/global/widget/global_image_loader.dart';
import 'package:tixe_app/global/widget/global_svg_loader.dart';
import 'package:tixe_app/utils/styles/k_assets.dart';

class SignUpSocialLoginButtons extends StatelessWidget {
  const SignUpSocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GlobalImageLoader(
          imagePath: KAssetName.facebook.imagePath,
          height: 40.h,
          width: 40.w,
        ),
        SizedBox(width: 10.w),
        GlobalImageLoader(
          imagePath: KAssetName.apple.imagePath,
          height: 40.h,
          width: 40.w,
        ),
        SizedBox(width: 10.w),
        GlobalImageLoader(
          imagePath: KAssetName.google.imagePath,
          height: 40.h,
          width: 40.w,
        ),
      ],
    );
  }
}
