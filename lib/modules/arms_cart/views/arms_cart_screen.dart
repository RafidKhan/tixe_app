import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/arms_cart/views/components/amount_section_widget.dart';
import 'package:tixe_flutter_app/modules/arms_cart/views/components/cart_list_widget.dart';

class ArmsCartScreen extends StatefulWidget {
  const ArmsCartScreen({Key? key}) : super(key: key);

  @override
  State<ArmsCartScreen> createState() => _ArmsCartScreenState();
}

class _ArmsCartScreenState extends State<ArmsCartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GlobalHeaderWidget(
            title: "Arms Cart",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CartListWidget(isShipping: false,),
                    AmountSectionWidget(),
                    // ShippingSectionWidget(),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    // Row(
                    //   children: [
                    //     Checkbox(
                    //       checkColor: KColor.white.color,
                    //       activeColor: KColor.btnGradient1.color,
                    //       value: ArmsCartController.sameAsShipping,
                    //       onChanged: (v) {
                    //         ArmsCartController.toggleSameAddress();
                    //       },
                    //     ),
                    //     GlobalText(
                    //       str: "Same as shipping address",
                    //       fontSize: 16.sp,
                    //       fontWeight: FontWeight.w400,
                    //       color: KColor.white.color,
                    //     ),
                    //   ],
                    // ),
                    // BillingSectionWidget(),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       Navigation.push(
                    //         appRoutes: AppRoutes.armsPayment,
                    //       );
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: KColor.btnGradient1.color,
                    //       padding: EdgeInsets.symmetric(vertical: 12.h),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(8.r),
                    //       ),
                    //     ),
                    //     child: GlobalText(
                    //       str: "Proceed To Payment",
                    //       fontSize: 16.sp,
                    //       fontWeight: FontWeight.w400,
                    //       color: KColor.black.color,
                    //     ),
                    //   ),
                    // ),
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
