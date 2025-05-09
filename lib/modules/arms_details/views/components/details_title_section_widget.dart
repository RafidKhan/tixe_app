import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class DetailsTitleSectionWidget extends StatelessWidget {
  const DetailsTitleSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 16.w,right: 16.w,top:8.w ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            str: "HR3 Holographic Sight",
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 5.h,),
          const GlobalText(
            str: "Pistol, Firearms",
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 5.h,),
          Row(
            children: [
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
              Spacer(),
              Row(
                children: [
                  Icon(Icons.star,color: KColor.btnGradient1.color,),
                  GlobalText(
                    str: "4.5",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: KColor.white.color,
                  ),
                  GlobalText(
                    str: "(2 Reviews)",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: KColor.white.color,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5.h,),
          Divider(color: Color(0xffD1C9C9),),
          SizedBox(height: 5.h,),
        ],
      ),

    );
  }
}