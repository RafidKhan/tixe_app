import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_controller.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

import '../../../../../utils/styles/k_colors.dart';

class FitnessHeartRateGraph extends ConsumerWidget {
  const FitnessHeartRateGraph({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final state = ref.watch(sharedController);
    final HeartRateStatus status = HeartRateStatusExtension.fromValue((num.tryParse(state.heartRate)??0));
    return Expanded(
      child: Container(
        height: 170.h,
        padding: EdgeInsets.only(
          top: 16.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: KColor.shadeGradient2.color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: GlobalText(
                str: "Heart Rate",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: KColor.white.color,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GlobalImageLoader(
                    imagePath: KAssetName.icHeartRatePng.imagePath,
                    height: 30.h,
                    width: 30.w,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  GlobalText(
                    str: "${state.heartRate} bpm",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: KColor.white.color,
                  )
                ],
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: GlobalImageLoader(
                    imagePath: KAssetName.icHeartRateGraphPng.imagePath,
                    height: 70.h,
                  ),
                ),
                GlobalText(
                  str: status.label,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
