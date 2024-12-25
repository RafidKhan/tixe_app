import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_details/controller/training_details_controller.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../../../global/widget/global_slot_breakdown_container.dart';
import '../../../../../global/widget/global_slot_item_widget.dart';

class TrainingAvailableSlots extends ConsumerWidget {
  const TrainingAvailableSlots({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(trainingDetailsController);
    final controller = ref.read(trainingDetailsController.notifier);

    //if (state.scheduleType == ScheduleType.DateBased) {
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
                  isSelected: index == state.selectedSlotIndex,
                  onTap: () {
                    controller.setSlotIndex(index);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 10.w,
                );
              },
            ),
          ),
          SizedBox(height: 20.h),
          const GlobalSlotBreakDownContainer(),
        ],
      ),
    );
    //}

    return const SizedBox();
  }
}
