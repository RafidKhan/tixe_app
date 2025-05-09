import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/arms_cart/views/components/amount_section_widget.dart';
import 'package:tixe_flutter_app/modules/arms_cart/views/components/cart_list_widget.dart';
import 'package:tixe_flutter_app/modules/arms_cart/views/components/custom_container_widget.dart';
import 'package:tixe_flutter_app/modules/arms_cart/views/components/shopping_section_widget.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(KAssetName.paymentSuccessPng.imagePath),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GlobalText(
                  str: "Payment",
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                  color: KColor.white.color,
                ),
                SizedBox(width: 10,),
                GlobalText(
                  str: "Complete",
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                  color: KColor.btnGradient1.color,
                ),
              ],
            ),
            GlobalText(
              str: "Your payment has been received. Your Order will be delivered to you soon",
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: KColor.white.color,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20,),

            GlobalButton(
              buttonText: "Go to store",
              onPressed: () {
                Navigation.pushAndRemoveUntil(appRoutes: AppRoutes.armStore);
              },
            ),


          ],
        ),
      ),
    );
  }
}



