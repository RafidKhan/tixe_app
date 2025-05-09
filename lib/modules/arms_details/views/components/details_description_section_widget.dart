import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class DetailsDescriptionSectionWidget extends StatelessWidget {
  const DetailsDescriptionSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:  16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            str: "Description",
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 5.h,),
          const GlobalText(
            str: "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing",
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),

        ],
      ),

    );
  }
}