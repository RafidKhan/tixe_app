import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class SameOwnerDialog extends StatelessWidget {
  const SameOwnerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: GlobalText(
                    str: 'Can’t add this item to cart',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () => Navigation.pop(),
                  child: Icon(
                    Icons.close,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            GlobalText(
              str:
                  'Sorry! Items from different sellers can’t be added to the cart. Please delete existing items from your cart and continue',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            SizedBox(
              height: 20.h,
            ),
            GlobalButton(
              onPressed: () {
                Navigation.push(appRoutes: AppRoutes.armsCart);
              },
              buttonText: "Go to Cart Page",
            ),
            SizedBox(
              height: 20.h,
            ),
            GlobalButton(
              onPressed: () {
                Navigation.pop();
              },
              buttonText: "Close",
              borderColor: KColor.btnGradient1.color,
              activeColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
