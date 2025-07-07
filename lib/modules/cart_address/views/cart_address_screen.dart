import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_textformfield.dart';
import 'package:tixe_flutter_app/modules/arm_store/controller/arm_store_controller.dart';
import 'package:tixe_flutter_app/modules/arms_cart/controller/arms_cart_controller.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../global/widget/global_header_widget.dart';
import '../../../global/widget/scaffold/tixe_main_scaffold.dart';
import '../../arms_cart/views/components/billing_section_widget.dart';
import '../../arms_cart/views/components/cart_list_widget.dart';
import '../../arms_cart/views/components/shipping_section_widget.dart';
import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class CartAddressScreen extends StatelessWidget {
  const CartAddressScreen({Key? key}) : super(key: key);

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
                    CartListWidget(
                      isShipping: true,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ShippingSectionWidget(),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: KColor.white.color,
                          activeColor: KColor.btnGradient1.color,
                          value: ArmStoreController.sameAsShipping,
                          onChanged: (v) {
                            ArmStoreController.toggleSameAddress();
                          },
                        ),
                        GlobalText(
                          str: "Same as shipping address",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: KColor.white.color,
                        ),
                      ],
                    ),
                    BillingSectionWidget(),
                    SizedBox(
                      height: 20.h,
                    ),
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

                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            GlobalText(
                              str: "Total",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: KColor.white.color,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            GlobalText(
                              str: "Shipping",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: KColor.white.color,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GlobalText(
                              str: "\$${ArmStoreController.totalCartPrice}",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: KColor.white.color,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            GlobalText(
                              str: "\$${ArmStoreController.shippingCharge}",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: KColor.white.color,
                            ),
                          ],
                        )
                      ],
                    ),

                    SizedBox(
                      height: 5.h,
                    ),
                    GlobalText(
                      str: "Discount Code",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: KColor.grey.color,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    // Stack(
                    //   children: [
                    //     CustomContainerWidget(
                    //       height: 50.h,
                    //       color: KColor.white.color,
                    //       child: GlobalText(
                    //         str: "KKNFSKNKFG",
                    //         fontSize: 16.sp,
                    //         fontWeight: FontWeight.w400,
                    //         color: KColor.black.color,
                    //       ),
                    //     ),
                    //     Positioned(
                    //         top: 5,
                    //         right: 5,
                    //         child: CustomContainerWidget(
                    //           height: 40.h,
                    //           width: 120.w,
                    //           color: KColor.btnGradient1.color,
                    //           child: Center(
                    //             child: GlobalText(
                    //               str: "Apply Code",
                    //               fontSize: 12.sp,
                    //               fontWeight: FontWeight.w400,
                    //               color: KColor.black.color,
                    //             ),
                    //           ),
                    //         ))
                    //   ],
                    // ),
                    GlobalTextFormfield(
                      textEditingController: ArmStoreController.code,
                      suffixIcon: _applyCodeButton(
                        context,
                        onTap: () {
                          ArmStoreController.applyDiscountCode();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GlobalText(
                              str: "Discount",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: KColor.white.color,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            GlobalText(
                              str: "-\$${ArmStoreController.discountAmount}",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: KColor.white.color,
                            ),
                          ],
                        )
                      ],
                    ),
                    const Divider(
                      color: Color(0xffD1C9C9),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GlobalText(
                            str: "Grand Total",
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: KColor.white.color,
                          ),
                          GlobalText(
                            str: "\$${ArmStoreController.grandTotal}",
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: KColor.white.color,
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xffD1C9C9),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    GlobalButton(
                      onPressed: () {
                        Navigation.push(appRoutes: AppRoutes.armsPayment);
                      },
                      buttonText: "Proceed To Payment",
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

  Widget _applyCodeButton(
    BuildContext context, {
    required VoidCallback? onTap,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: KColor.btnGradient1.color,
              borderRadius: BorderRadius.circular(3.r),
            ),
            child: Center(
              child: GlobalText(
                str: context.loc.apply_code,
                color: KColor.black.color,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
