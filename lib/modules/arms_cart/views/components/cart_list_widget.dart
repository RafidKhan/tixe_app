import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/arms_cart/views/components/custom_image_bg_container_widget.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      child: ListView.builder(

        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.only(bottom:16.w), // Adjust spacing
              child: Container(
                height: 110.h,
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                ),
                width:   context.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: KColor.darkGrey.color,
                ),

                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CustomImageBGContainerWidget(
                        height: 120.h,
                        width: 100.w,
                        child: const Center(child: Icon(Icons.image)),
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GlobalText(
                          str: "HR3 Holographic Sight",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: KColor.white.color,
                        ),
                        Container(

                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 3.h,
                          ),
                          decoration: BoxDecoration(
                            color: KColor.white.color,
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                          child: GlobalText(
                            str: "\$720",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: KColor.black.color,
                          ),
                        ),
                      ],
                    )
                  ],
                ) ,
              )
          );
        },
      ),
    );
  }
}