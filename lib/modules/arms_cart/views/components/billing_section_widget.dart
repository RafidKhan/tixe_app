import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/global/widget/global_textformfield.dart';
import 'package:tixe_flutter_app/modules/arms_cart/controller/arms_cart_controller.dart';
import 'package:tixe_flutter_app/modules/arms_cart/views/components/custom_container_widget.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class BillingSectionWidget extends StatelessWidget {
  const BillingSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
        GlobalText(
          str: "Billing Address",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: KColor.white.color,
        ),
        SizedBox(
          height: 15.h,
        ),
        GlobalText(
          str: "Your Name",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: KColor.grey.color,
        ),
        GlobalTextFormfield(
          textEditingController: ArmsCartController.billingName,
        ),
        SizedBox(
          height: 10.h,
        ),
        GlobalText(
          str: "Country",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: KColor.grey.color,
        ),
        GlobalTextFormfield(
          textEditingController: ArmsCartController.billingCountry,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalText(
                    str: "State",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: KColor.white.color,
                  ),
                  GlobalTextFormfield(
                    textEditingController: ArmsCartController.billingState,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalText(
                    str: "City",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: KColor.white.color,
                  ),
                  GlobalTextFormfield(
                    textEditingController: ArmsCartController.billingCity,
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        GlobalText(
          str: "Address",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: KColor.grey.color,
        ),
        GlobalTextFormfield(
          textEditingController: ArmsCartController.billingAddress,
        ),
        SizedBox(
          height: 10.h,
        ),
        GlobalText(
          str: "Phone",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: KColor.grey.color,
        ),
        GlobalTextFormfield(
          textEditingController: ArmsCartController.billingMobile,
        ),
        SizedBox(
          height: 10.h,
        ),
        GlobalText(
          str: "Email",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: KColor.grey.color,
        ),
        GlobalTextFormfield(
          textEditingController: ArmsCartController.billingEmail,
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
