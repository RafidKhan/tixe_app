import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/arms_cart/views/components/custom_container_widget.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class AmountSectionWidget extends StatelessWidget {
  const AmountSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h,),
                GlobalText(
                  str: "Total",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: KColor.white.color,
                ),
                SizedBox(height: 5.h,),
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
              children: [
                GlobalText(
                  str: "\$270.00",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: KColor.white.color,
                ),
                SizedBox(height: 5.h,),
                GlobalText(
                  str: "\$20.00",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: KColor.white.color,
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 5.h,),
        GlobalText(
          str: "Discount Code",
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: KColor.grey.color,
        ),
        SizedBox(height: 3.h,),

        Stack(
          children: [
            CustomContainerWidget(
              height: 50.h,
              color: KColor.white.color,
              child: GlobalText(
                str: "KKNFSKNKFG",
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: KColor.black.color,
              ),),

            Positioned(
                top: 5,
                right: 5,
                child: CustomContainerWidget(
                  height: 40.h,
                  width: 120.w,
                  color: KColor.btnGradient1.color,
                  child: Center(
                    child: GlobalText(
                      str: "Apply Code",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: KColor.black.color,
                    ),
                  ),))
          ],
        ),


        SizedBox(height: 5.h,),
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
                  str: "-\$5.00",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: KColor.white.color,
                ),
              ],
            )
          ],
        ),
        const Divider(color: Color(0xffD1C9C9),),
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
                str: "\$500.00",
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: KColor.white.color,
              ),
            ],
          ),
        ),

        const Divider(color: Color(0xffD1C9C9),),
      ],
    );
  }
}