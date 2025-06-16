import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../controller/arms_details_controller.dart';

class DetailsTitleSectionWidget extends StatelessWidget {
  const DetailsTitleSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final detail = ArmsDetailsController.details?.gear;
    final reviews = ArmsDetailsController.details?.reviewStatistics;

    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            str: detail?.title ?? "",
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 5.h,
          ),
          GlobalText(
            str: (detail?.categories ?? [])
                .map((e) => e.name ?? '')
                .toList()
                .join(", "),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 5.h,
          ),
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
                  str: "\$${detail?.price??0}",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: KColor.black.color,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: KColor.btnGradient1.color,
                  ),
                  GlobalText(
                    str: "${reviews?.averageRating ?? 0.0}",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: KColor.white.color,
                  ),
                  GlobalText(
                    str: "(${reviews?.totalReviews??0} Reviews)",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: KColor.white.color,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Divider(
            color: Color(0xffD1C9C9),
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
