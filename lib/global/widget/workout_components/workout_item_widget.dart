import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/model/workout_details_nav_model.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../data_provider/pref_helper.dart';
import '../global_divider.dart';

class WorkoutItemWidget extends StatelessWidget {
  final int? id;
  final String? title;
  final String? amount;
  final bool isFree;
  final String? shortDescription;
  final String? image;
  final String? time;
  final num? calorie;
  final bool isAfterPurchase;

  const WorkoutItemWidget({
    super.key,
    required this.id,
    required this.title,
    required this.amount,
    required this.shortDescription,
    required this.image,
    required this.isFree,
    required this.time,
    required this.calorie,
    required this.isAfterPurchase,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: KColor.transparent.color,
      focusColor: KColor.transparent.color,
      highlightColor: KColor.transparent.color,
      onTap: () {
        if (PrefHelper.getLoginStatus()) {
          if (isAfterPurchase) {
            ///
          } else {
            Navigation.push(
              appRoutes: AppRoutes.workoutDetails,
              arguments: WorkoutDetailsNavModel(
                id: id,
              ),
            );
          }
        } else {}
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
            if (!isAfterPurchase) ...[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 3.h,
                ),
                decoration: BoxDecoration(
                  color: isFree ? KColor.transparent.color : KColor.white.color,
                  borderRadius: BorderRadius.circular(3.r),
                  border: Border.all(
                    color:
                        isFree ? KColor.white.color : KColor.transparent.color,
                  ),
                ),
                child: GlobalText(
                  str: isFree ? context.loc.free : "\$$amount",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: isFree ? KColor.white.color : KColor.black.color,
                ),
              ),
              SizedBox(height: 20.h),
            ],
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GlobalText(
                str: title ?? "",
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
                    imagePath: KAssetName.workoutPng.imagePath,
                    height: 12.h,
                    width: 16.w,
                    color: KColor.workoutColor.color,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  GlobalText(
                    str: context.loc.workout,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: KColor.workoutColor.color,
                  ),
                  const Spacer(),
                  GlobalText(
                    str:
                        "${time ?? "0 ${context.loc.minute}"}  | ${calorie ?? 0} Cal",
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: KColor.white.color,
                  )
                ],
              ),
            ),
            SizedBox(height: 10.h),
            const GlobalDivider(),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GlobalText(
                str: shortDescription ?? "",
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: KColor.white.color,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (image != null) ...[
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: SizedBox(
                    width: context.width,
                    child: GlobalImageLoader(
                      imagePath: image ?? "",
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
