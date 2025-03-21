import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

import '/global/widget/global_text.dart';
import '../../../../../global/widget/global_bottomsheet_textformfield.dart';
import '../../../../../utils/styles/k_colors.dart';
import '../../../../../utils/view_util.dart';
import '../../controller/preferences_controller.dart';

class PreferenceNotifications extends ConsumerWidget {
  const PreferenceNotifications({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(preferencesController);

    final controller = ref.read(preferencesController.notifier);
    final notificationEnabled = state.notificationEnabled;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GlobalImageLoader(
              imagePath: KAssetName.icNotificationPng.imagePath,
              height: 15.h,
              width: 13.w,
            ),
            SizedBox(
              width: 4.w,
            ),
            const GlobalText(
              str: "Notification",
            )
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            const Expanded(
              child: GlobalText(
                str: "Notification Enabled",
              ),
            ),
            Switch(
              value: notificationEnabled,
              activeColor: KColor.btnGradient1.color,
              onChanged: (value) => controller.toggleNotification()
            )
          ],
        ),
        SizedBox(height: 20.h),
        GlobalText(
          str: "Turn off notification for",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: KColor.grey.color,
        ),
        SizedBox(height: 10.h),
        Opacity(
          opacity: notificationEnabled ? 0.5 : 1.0,
          // Reduce opacity when ignoring
          child: GlobalBottomSheetTextFormField(
            textEditingController: controller.notificationEndController,
            onTap: () {
              if (notificationEnabled) {
                ViewUtil.snackBar(
                    "Notification is enabled. Turn it off first.");
              } else {
                ViewUtil.showOptionPickerBottomSheet(
                  options: state.notificationPreferences,
                  onSelect: (option) {
                    controller.setNotificationData(option);
                  },
                );
              }
            },
          ),
        )
      ],
    );
  }
}
