import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../../controller/arm_store_controller.dart';

class ArmStoreCartButton extends StatelessWidget {
  const ArmStoreCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItemsLength = ArmStoreController.cartItems.length;

    return Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: InkWell(
        onTap: () {
          if (ArmStoreController.cartItems.isNotEmpty) {
            Navigation.push(appRoutes: AppRoutes.armsCart);
          } else {
            ViewUtil.snackBar("No arm added in cart", context);
          }
        },
        child: SizedBox(
          height: 40.h,
          width: 40.w,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              GlobalImageLoader(
                imagePath: KAssetName.icCartPng.imagePath,
                height: 30.h,
                width: 30.w,
              ),
              if (cartItemsLength > 0)
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    //height: 40.h,
                    padding: EdgeInsets.all(4.w),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: GlobalText(
                      str: cartItemsLength.toString(),
                      fontSize: 14,
                      color: KColor.white.color,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
