import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/modules/listing_payment/model/listing_payment_nav_model.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '/global/widget/global_text.dart';
import '../../../utils/enum.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final ListingPaymentNavModel model;

  const PaymentSuccessScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    late final String title;
    switch (model.type) {
      case ListingType.Arms:
        title = "arms";
        break;
      case ListingType.Workout:
        title = "workout";
        break;
      case ListingType.Training:
        title = "training";
        break;
    }
    return Scaffold(
      body: Container(
        width: context.width,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            GlobalImageLoader(
              imagePath: KAssetName.paymentCompletePng.imagePath,
              height: 68.h,
              width: 68.w,
            ),
            SizedBox(height: 20.h),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                  color: KColor.white.color,
                ),
                children: [
                  const TextSpan(
                    text: "Payment",
                  ),
                  TextSpan(
                    text: " Complete!",
                    style: TextStyle(
                      color: KColor.btnGradient1.color,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            GlobalText(
              str: "Your $title has been listed",
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            SizedBox(height: 20.h),
            GlobalButton(
              onPressed: () {},
              buttonText: "View ${title.toCapitalized()}",
            )
          ],
        ),
      ),
    );
  }
}
