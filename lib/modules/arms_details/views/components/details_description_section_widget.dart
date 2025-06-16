import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../controller/arms_details_controller.dart';

class DetailsDescriptionSectionWidget extends StatelessWidget {
  const DetailsDescriptionSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final detail = ArmsDetailsController.details?.gear;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            str: "Description",
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 5.h,
          ),
          GlobalText(
            str: detail?.description ?? "",
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
