import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/global/widget/global_textformfield.dart';
import 'package:tixe_flutter_app/modules/arm_store/controller/arm_store_controller.dart';
import 'package:tixe_flutter_app/modules/arms_cart/controller/arms_cart_controller.dart';
import 'package:tixe_flutter_app/modules/arms_cart/views/components/custom_container_widget.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class ShippingSectionWidget extends StatelessWidget {
  const ShippingSectionWidget({
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
          str: "Shipping Address",
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
          textEditingController: ArmStoreController.shippingName,
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
          textEditingController: ArmStoreController.shippingCountry,
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
                    textEditingController: ArmStoreController.shippingState,
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
                    textEditingController: ArmStoreController.shippingCity,
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
          textEditingController: ArmStoreController.shippingAddress,
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
          textEditingController: ArmStoreController.sippingMobile,
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
          textEditingController: ArmStoreController.sippingEmail,
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
