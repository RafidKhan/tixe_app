import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_menu_icon.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class ProfileArmStore extends StatelessWidget {
  const ProfileArmStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: KColor.btnGradient1.color,
        ),
      ),
      child: Row(
        children: [
          GlobalImageLoader(
            imagePath: KAssetName.icArmStorePng.imagePath,
            height: 40.h,
            width: 40.w,
          ),
          SizedBox(
            width: 20.w,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalText(
                  str: context.loc.arm_store,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: KColor.white.color,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                GlobalText(
                  str: context.loc.buy_amazing_gears,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: KColor.grey.color,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
