import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_details/controller/training_details_controller.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../../../utils/styles/k_assets.dart';

class TrainingLocation extends ConsumerWidget {
  const TrainingLocation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(trainingDetailsController);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            str: context.loc.training_location,
            color: KColor.white.color,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 20.h),
          GlobalText(
            str: state.trainingDetail?.address ?? "",
            color: KColor.white.color,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 20.h),
          GlobalImageLoader(
            imagePath: KAssetName.dummyMapLocationPng.imagePath,
            height: 213.h,
            width: context.width,
          )
        ],
      ),
    );
  }
}
