import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_chip_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_enrollment/controller/training_enrollment_controller.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_gears_checklist/model/training_gears_checklist_nav_model.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class TrainingEnrollmentGearChecklist extends ConsumerWidget {
  const TrainingEnrollmentGearChecklist({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(trainingEnrollmentController);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            str: context.loc.gear_checklist,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: KColor.white.color,
          ),
          SizedBox(height: 20.h),
          Container(
            height: 90.h,
            decoration: BoxDecoration(
              color: KColor.bodyGradient1.color,
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
            child: Row(
              children: [
                Container(
                  height: 60.h,
                  width: 60.w,
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    color: KColor.liteGrey.color,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: GlobalImageLoader(
                    imagePath: KAssetName.trainingPng.imagePath,
                    height: 12.h,
                    width: 16.w,
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GlobalText(
                      str:
                          "0/${state.model?.trainingDetail?.gearsEquipments?.length} ${context.loc.gears}",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: KColor.white.color,
                    ),
                    SizedBox(height: 10.h),
                    GlobalText(
                      str: context.loc.check_required_gears,
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                      color: KColor.grey.color,
                    ),
                  ],
                ),
                const Spacer(),
                GlobalChipWidget(
                  title: context.loc.check_now,
                  onTap: () {
                    Navigation.push(
                      appRoutes: AppRoutes.trainingGearsChecklist,
                      arguments: TrainingGearsChecklistNavModel(
                        trainingDetail: state.model?.trainingDetail,
                        reviewStatistics: state.model?.reviewStatistics,
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
