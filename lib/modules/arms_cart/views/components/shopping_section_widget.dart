
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/arms_cart/views/components/custom_container_widget.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class ShoppingSectionWidget extends StatelessWidget {
  const ShoppingSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h,),
        GlobalText(
          str: "Shipping Address",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: KColor.white.color,
        ),
        SizedBox(height: 15.h,),
        GlobalText(
          str: "Your Name",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: KColor.grey.color,
        ),
        CustomContainerWidget(height: 50.h, child:  GlobalText(
          str: "Your Name",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: KColor.black.color,
        ),),
        SizedBox(height: 10.h,),
        Row(
          children: [
            Column(
              children: [
                GlobalText(
                  str: "State",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: KColor.white.color,
                ) ,
                CustomContainerWidget(height: 50.h,
                  width: 170.w,
                  child:  GlobalText(
                    str: "Dhaka,Bangladesh",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: KColor.black.color,
                  ),),
              ],
            ),
            SizedBox(width:15 .w,),

            Column(
              children: [
                GlobalText(
                  str: "State",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: KColor.white.color,
                ) ,
                CustomContainerWidget(height: 50.h,
                  width: 170.w,
                  child:  GlobalText(

                    str: "Dhaka,Bangladesh",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: KColor.black.color,
                  ),),
              ],
            )
          ],
        ),
        SizedBox(height: 10.h,),
        GlobalText(
          str: "Address",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: KColor.grey.color,
        ),
        CustomContainerWidget(height: 50.h, child:  GlobalText(
          str: "Dhaka,Bangladesh",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: KColor.black.color,
        ),),
        SizedBox(height: 10.h,),
        GlobalText(
          str: "Phone",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: KColor.grey.color,
        ),
        CustomContainerWidget(height: 50.h, child:  GlobalText(
          str: "01555555555",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: KColor.black.color,
        ),),
        SizedBox(height: 10.h,),
        GlobalText(
          str: "Email",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: KColor.grey.color,
        ),
        CustomContainerWidget(height: 50.h, child:  GlobalText(
          str: "abc@gmail.com",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: KColor.black.color,
        ),),
        SizedBox(height: 10.h,),
        GlobalText(
          str: "Country",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: KColor.grey.color,
        ),
        CustomContainerWidget(height: 50.h, child:  GlobalText(
          str: "Bangladesh",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: KColor.black.color,
        ),),

      ],
    );
  }
}