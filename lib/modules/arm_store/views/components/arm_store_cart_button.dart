import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

class ArmStoreCartButton extends StatelessWidget {
  const ArmStoreCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: Stack(
        children: [
          GlobalImageLoader(
            imagePath: KAssetName.icCartPng.imagePath,
            height: 24.h,
            width: 24.w,
          ),
        ],
      ),
    );
  }
}
