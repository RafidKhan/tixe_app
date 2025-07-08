import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_textformfield.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/arms_cart/views/components/amount_section_widget.dart';
import 'package:tixe_flutter_app/modules/arms_cart/views/components/cart_list_widget.dart';
import 'package:tixe_flutter_app/modules/arms_cart/views/components/custom_container_widget.dart';
import 'package:tixe_flutter_app/modules/arms_cart/views/components/shipping_section_widget.dart';
import 'package:tixe_flutter_app/modules/arms_payment/views/payment_success_screen.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../arm_store/controller/arm_store_controller.dart';
import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class ArmsPaymentScreen extends StatelessWidget {
  const ArmsPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paymentMethods = [context.loc.stripe];
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
                    const CartListWidget(
                      isShipping: false,
                    ),
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

                    //const AmountSectionWidget(),

                    SizedBox(
                      height: 20.h,
                    ),
                    GlobalText(
                      str: "Payment Method",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: KColor.white.color,
                    ),
                    SizedBox(
                      height: 5.h,
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
                              color: KColor.btnGradient1.color,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 10.h),
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
                              //if (isSelected) ...[
                              const Spacer(),
                              GlobalImageLoader(
                                imagePath: KAssetName.icCheckboxPng.imagePath,
                                height: 20.h,
                                width: 20.w,
                              ),
                              // ]
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10.h);
                      },
                    ),

                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PaymentSuccessScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: KColor.btnGradient1.color,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: GlobalText(
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
