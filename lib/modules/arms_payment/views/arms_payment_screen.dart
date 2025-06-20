import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/arms_cart/views/components/amount_section_widget.dart';
import 'package:tixe_flutter_app/modules/arms_cart/views/components/cart_list_widget.dart';
import 'package:tixe_flutter_app/modules/arms_cart/views/components/custom_container_widget.dart';
import 'package:tixe_flutter_app/modules/arms_cart/views/components/shipping_section_widget.dart';
import 'package:tixe_flutter_app/modules/arms_payment/views/payment_success_screen.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class ArmsPaymentScreen extends StatelessWidget {
  const ArmsPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GlobalHeaderWidget(
            title: "Payment",
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CartListWidget(),
                    const AmountSectionWidget(),

                    SizedBox(height: 20.h,),
                    GlobalText(
                      str: "Payment Method",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: KColor.white.color,
                    ) ,
                    SizedBox(height: 5.h,),
                    Stack(
                      children: [
                        CustomContainerWidget(
                          height: 50.h,
                          color: KColor.white.color,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 45.0),
                            child: GlobalText(
                              str: "Stripe",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: KColor.black.color,
                            ),
                          ),),

                        Positioned(
                            top: 5,
                            left: 10,
                            child: Image.asset(KAssetName.stripePng.imagePath,height: 40,)),

                        Positioned(
                            top: 5,
                            right: 5,
                            child: Image.asset(KAssetName.selectedCheckBoxPng.imagePath,height: 50,))
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentSuccessScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: KColor.btnGradient1.color,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child:  GlobalText(
                          str: "Proceed To Payment",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: KColor.black.color,
                        ),

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}



