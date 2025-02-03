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

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        children: [
          GlobalImageLoader(
            imagePath: KAssetName.tixeLogoPng.imagePath,
            height: 28.h,
            width: 98.w,
            fit: BoxFit.cover,
          ),
          const Spacer(),
          InkWell(
            onTap: () => Navigation.pop(),
            child: GlobalImageLoader(
              imagePath: KAssetName.icClosePng.imagePath,
              height: 24.h,
              width: 24.w,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
