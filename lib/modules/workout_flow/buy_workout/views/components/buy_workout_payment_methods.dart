import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../../../../../utils/styles/k_assets.dart';
import '../../../../../utils/styles/k_colors.dart';

class BuyWorkoutPaymentMethods extends StatelessWidget {
  const BuyWorkoutPaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentMethods = [context.loc.stripe];
    final isSelected = true;
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            str: context.loc.payment_method,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: KColor.white.color,
          ),
          SizedBox(height: 10.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: paymentMethods.length,
            itemBuilder: (context, index) {
              final paymentMethod = paymentMethods[index];
              return Container(
                height: 90.h,
                decoration: BoxDecoration(
                  color: KColor.bodyGradient1.color,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: isSelected
                        ? KColor.btnGradient1.color
                        : KColor.transparent.color,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Row(
                  children: [
                    Container(
                      height: 60.h,
                      width: 60.w,
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: KColor.liteGrey.color,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: GlobalText(
                          str: paymentMethod.substring(0, 1),
                          style: GoogleFonts.squadaOne(
                            color: KColor.white.color,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: GlobalText(
                        str: paymentMethod,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: KColor.white.color,
                      ),
                    ),
                    if (isSelected) ...[
                      const Spacer(),
                      GlobalImageLoader(
                        imagePath: KAssetName.icCheckboxPng.imagePath,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ]
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.h);
            },
          )
        ],
      ),
    );
  }
}
