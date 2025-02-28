import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class FeaturedArmItem extends StatelessWidget {
  final int? id;
  final String? title;
  final String? amount;
  final String? shortDescription;
  final String? image;

  const FeaturedArmItem({
    super.key,
    required this.id,
    required this.title,
    required this.amount,
    required this.shortDescription,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: KColor.transparent.color,
      focusColor: KColor.transparent.color,
      highlightColor: KColor.transparent.color,
      onTap: () {},
      child: Container(
        height: 340.h,
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
        ),
        width: context.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              KColor.cardGradient1.color,
              KColor.cardGradient2.color,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (image != null) ...[
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: SizedBox(
                    width: context.width,
                    child: GlobalImageLoader(
                      imagePath: image ?? "",
                      height: 85.h,
                      fit: BoxFit.contain,
                      imageFor: ImageFor.network,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
            ],
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 3.h,
              ),
              decoration: BoxDecoration(
                color: KColor.white.color,
                borderRadius: BorderRadius.circular(3.r),
              ),
              child: GlobalText(
                str: "\$${amount}",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: KColor.black.color,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GlobalText(
                str: title ?? "",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: KColor.white.color,
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GlobalText(
                str: shortDescription ?? "",
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: KColor.white.color,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Transform.scale(
                scale: 0.8,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    GlobalButton(
                      onPressed: () {},
                      buttonText: "Buy Now",
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GlobalButton(
                      onPressed: () {},
                      buttonText: "Details",
                      borderColor: KColor.btnGradient1.color,
                      activeColor: KColor.transparent.color,
                      textColor: KColor.white.color,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
