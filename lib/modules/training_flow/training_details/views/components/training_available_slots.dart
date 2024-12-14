import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../../../global/widget/global_header_widget.dart';
import '../../../../../global/widget/global_slot_item_widget.dart';
import '../../../../../utils/styles/k_assets.dart';

class TrainingAvailableSlots extends StatelessWidget {
  const TrainingAvailableSlots({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            str: context.loc.available_slots,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: KColor.white.color,
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 90.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return GlobalSlotItemWidget(
                  showSelectedIcon: false,
                  isSelected: index == 0,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 10.w,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
