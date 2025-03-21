import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/listing_payment/model/listing_payment_nav_model.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';
import '../../../global/widget/global_textformfield.dart';
import '../../../utils/enum.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class ListingPaymentScreen extends StatelessWidget {
  final ListingPaymentNavModel model;

  const ListingPaymentScreen({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    final paymentMethods = [context.loc.stripe];
    final isSelected = true;
    late final String title;
    switch (model.type) {
      case ListingType.Arms:
        title = "Arms";
        break;
      case ListingType.Workout:
        title = "Workout";
        break;
      case ListingType.Training:
        title = "Training";
        break;
    }
    return TixeMainScaffold(
        hasAppBar: true,
        body: Column(
          children: [
            GlobalHeaderWidget(
              title: "Listing $title",
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Expanded(
                          child: GlobalText(
                            str: "Listing Fee",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GlobalText(
                          str: "\$5.00",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: GlobalText(
                        str: "Discount Code",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffC3C5CA),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    GlobalTextFormfield(
                      //textEditingController: controller.discountCode,
                      suffixIcon: _applyCodeButton(
                        context,
                        onTap: () {
                          //controller.verifyTrainingDiscountCode();
                        },
                      ),
                    ),
                    SizedBox(height: 10.h),
                    GlobalText(
                      str: context.loc.grand_total,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: KColor.white.color,
                    ),
                    SizedBox(height: 5.h),
                    GlobalText(
                      str: "\$5.00",
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: KColor.white.color,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: context.width,
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
                                        borderRadius:
                                            BorderRadius.circular(10.r),
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
                                        imagePath:
                                            KAssetName.icCheckboxPng.imagePath,
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
                    ),
                    GlobalButton(
                      margin: EdgeInsets.symmetric(
                        vertical: 20.h,
                      ),
                      onPressed: () {
                        Navigation.pushAndRemoveUntil(
                          appRoutes: AppRoutes.paymentSuccess,
                          arguments: model,
                        );
                        //controller.setTimeSchedule();
                      },
                      buttonText: context.loc.confirm_and_pay,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
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
