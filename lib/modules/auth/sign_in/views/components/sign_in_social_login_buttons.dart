import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/utils/social_login_utils.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

class SignInSocialLoginButtons extends StatelessWidget {
  const SignInSocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GlobalImageLoader(
          imagePath: KAssetName.facebookPng.imagePath,
          height: 40.h,
          width: 40.w,
        ),
        SizedBox(width: 10.w),
        GlobalImageLoader(
          imagePath: KAssetName.applePng.imagePath,
          height: 40.h,
          width: 40.w,
        ),
        SizedBox(width: 10.w),
        InkWell(
          onTap: () async {
            await SocialLoginUtils.instance.gmailLogin();
          },
          child: GlobalImageLoader(
            imagePath: KAssetName.googlePng.imagePath,
            height: 40.h,
            width: 40.w,
          ),
        ),
      ],
    );
  }
}
