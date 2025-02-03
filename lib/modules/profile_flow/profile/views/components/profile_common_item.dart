import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../../../../../global/widget/global_text.dart';
import '../../../../../utils/styles/k_colors.dart';

class ProfileCommonItem extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback? onTap;

  const ProfileCommonItem({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.width,
        margin: EdgeInsets.only(bottom: 20.h),
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: KColor.shadeGradient2.color,
        ),
        child: Row(
          children: [
            GlobalImageLoader(
              imagePath: image,
              height: 40.h,
              width: 40.w,
            ),
            SizedBox(
              width: 20.w,
            ),
            Flexible(
              child: GlobalText(
                str: title,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: KColor.white.color,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
