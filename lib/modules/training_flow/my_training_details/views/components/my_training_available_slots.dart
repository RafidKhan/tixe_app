import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tixe_flutter_app/global/model/global_slot_breakdown_model.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../../../global/widget/global_slot_breakdown_container.dart';
import '../../../../../global/widget/global_slot_item_widget.dart';
import '../../controller/my_training_details_controller.dart';

class MyTrainingAvailableSlots extends ConsumerWidget {
  const MyTrainingAvailableSlots({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myTrainingDetailsController);

    final slot = state.trainingDetail?.timeSchedule;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            str: context.loc.schedule,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: KColor.white.color,
          ),
          SizedBox(height: 20.h),
          GlobalSlotItemWidget(
            showSelectedIcon: false,
            startDayNumber: (slot?.startDate ?? "").dayNumber.toString(),
            startDayName: (slot?.startDate ?? "").dayName,
            endDayNumber: (slot?.endDate ?? "").dayNumber.toString(),
            endDayName: (slot?.endDate ?? "").dayName,
            dayList: (slot?.dates ?? []).map((e) {
              final String dayName =
                  (DateFormat('EEE').format(DateTime.parse(e.date ?? "")))
                      .toUpperCase();
              return dayName;
            }).toList(),
            isSelected: false,
            onTap: null,
          ),
          SizedBox(height: 20.h),
          GlobalSlotBreakDownContainer(
            model: GlobalSlotBreakdownModel(
              slotDataList: (slot?.dates ?? []).map((e) {
                return SlotData(
                  date: (e.date ?? "").dayNumber.toString(),
                  day: (e.date ?? "").dayName,
                  startTime: e.startAt ?? "",
                  endTime: e.endAt ?? "",
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
