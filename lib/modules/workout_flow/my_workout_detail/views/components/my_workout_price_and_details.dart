import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_detail/controller/my_workout_detail_controller.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

import '../../../../../utils/styles/k_colors.dart';

class MyWorkoutPriceAndDetails extends ConsumerWidget {
  const MyWorkoutPriceAndDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myWorkoutDetailController);
    final workoutDetail = state.detail;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            str:
                "${workoutDetail?.duration ?? "0 ${context.loc.minute}"}  | ${workoutDetail?.calories ?? 0} Cal",
            color: KColor.white.color,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              GlobalImageLoader(
                imagePath: KAssetName.icVideoPng.imagePath,
                height: 11.h,
                width: 15.w,
              ),
              SizedBox(
                width: 4.w,
              ),
              GlobalText(
                str: context.loc.videos,
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                width: 10.w,
              ),
              GlobalImageLoader(
                imagePath: KAssetName.icInstructionPng.imagePath,
                height: 12.h,
                width: 11.w,
              ),
              SizedBox(
                width: 4.w,
              ),
              GlobalText(
                str: context.loc.instructions,
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ],
          )
        ],
      ),
    );
  }
}
