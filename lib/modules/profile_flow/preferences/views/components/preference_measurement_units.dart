import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/modules/profile_flow/preferences/controller/preferences_controller.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '/global/widget/global_text.dart';
import '../../../../../global/widget/global_bottomsheet_textformfield.dart';

class PreferenceMeasurementUnits extends ConsumerWidget {
  const PreferenceMeasurementUnits({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(preferencesController);
    final controller = ref.read(preferencesController.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GlobalImageLoader(
              imagePath: KAssetName.icUnitsPng.imagePath,
              height: 15.h,
              width: 8.w,
            ),
            SizedBox(
              width: 4.w,
            ),
            const GlobalText(
              str: "Measurement Units",
            )
          ],
        ),
        SizedBox(height: 20.h),
        GlobalText(
          str: "Height",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: KColor.grey.color,
        ),
        SizedBox(height: 10.h),
        GlobalBottomSheetTextFormField(
          textEditingController: controller.heightUnitController,
          onTap: () {
            ViewUtil.showOptionPickerBottomSheet(
              options: state.heightUnits,
              onSelect: (option) {
                controller.setHeightUnit(option);
              },
            );
          },
        ),
        SizedBox(height: 20.h),
        GlobalText(
          str: "Weight",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: KColor.grey.color,
        ),
        SizedBox(height: 10.h),
        GlobalBottomSheetTextFormField(
          textEditingController: controller.weightUnitController,
          onTap: () {
            ViewUtil.showOptionPickerBottomSheet(
              options: state.weightUnits,
              onSelect: (option) {
                controller.setWeightUnit(option);
              },
            );
          },
        ),

        SizedBox(height: 20.h),
        GlobalText(
          str: "Distance",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: KColor.grey.color,
        ),
        SizedBox(height: 10.h),
        GlobalBottomSheetTextFormField(
          textEditingController: controller.distanceUnitController,
          onTap: () {
            ViewUtil.showOptionPickerBottomSheet(
              options: state.distanceUnits,
              onSelect: (option) {
                controller.setDistanceUnit(option);
              },
            );
          },
        ),
      ],
    );
  }
}
