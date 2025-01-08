import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_slot_item_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/training_flow/training/model/my_trainings_response.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../data_provider/pref_helper.dart';
import '../global_divider.dart';

class MyTrainingItemWidgetBig extends StatelessWidget {
  final MyTrainingData data;

  const MyTrainingItemWidgetBig({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: KColor.transparent.color,
      focusColor: KColor.transparent.color,
      highlightColor: KColor.transparent.color,
      onTap: () {
        if (PrefHelper.getLoginStatus()) {
          Navigation.push(
            appRoutes: AppRoutes.myTrainingDetails,
            arguments: data,
          );
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
        ),
        width: context.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              KColor.cardGradient1.color,
              KColor.cardGradient2.color,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 3.h,
              ),
              decoration: BoxDecoration(
                color: KColor.white.color,
                borderRadius: BorderRadius.circular(3.r),
              ),
              child: GlobalText(
                str: "\$${data.enrollmentFee}",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: KColor.black.color,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GlobalText(
                str: data.title ?? "",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: KColor.white.color,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  GlobalImageLoader(
                    imagePath: KAssetName.trainingPng.imagePath,
                    height: 12.h,
                    width: 16.w,
                    color: KColor.secondary.color,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  GlobalText(
                    str: context.loc.training,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: KColor.secondary.color,
                  )
                ],
              ),
            ),
            SizedBox(height: 10.h),
            GlobalSlotItemWidget(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              showSelectedIcon: true,
              startDayNumber:
                  (data.timeSchedule?.startDate ?? "").dayNumber.toString(),
              startDayName: (data.timeSchedule?.startDate ?? "").dayName,
              endDayNumber:
                  (data.timeSchedule?.endDate ?? "").dayNumber.toString(),
              endDayName: (data.timeSchedule?.endDate ?? "").dayName,
              dayList: (data.timeSchedule?.dates ?? []).map((e) {
                final String dayName =
                    (DateFormat('EEE').format(DateTime.parse(e.date ?? "")))
                        .toUpperCase();
                return dayName;
              }).toList(),
              isSelected: false,
              onTap: null,
            ),
            SizedBox(height: 10.h),
            const GlobalDivider(),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GlobalText(
                str: data.description ?? "",
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: KColor.white.color,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (data.image != null) ...[
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: SizedBox(
                    width: context.width,
                    child: GlobalImageLoader(
                      imagePath: data.image ?? "",
                      height: 130.h,
                      width: context.width,
                      fit: BoxFit.fitWidth,
                      imageFor: ImageFor.network,
                    ),
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
