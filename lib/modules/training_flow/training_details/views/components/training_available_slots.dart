import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tixe_flutter_app/global/model/global_slot_breakdown_model.dart';
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

    if (state.scheduleType == ScheduleType.DateBased) {
      final slots = state.trainingDetail?.dateBased ?? [];

      final dateWiseSlots = state.selectedDateBasedSlot?.dates ?? [];

      if (slots.isNotEmpty) {
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
                  itemCount: slots.length,
                  itemBuilder: (context, index) {
                    final slot = slots[index];

                    return GlobalSlotItemWidget(
                      showSelectedIcon: false,
                      startDayNumber:
                          (slot.startDate ?? "").dayNumber.toString(),
                      startDayName: (slot.startDate ?? "").dayName,
                      endDayNumber: (slot.endDate ?? "").dayNumber.toString(),
                      endDayName: (slot.endDate ?? "").dayName,
                      dayList: (slot.dates ?? []).map((e) {
                        final String dayName = (DateFormat('EEE')
                                .format(DateTime.parse(e.date ?? "")))
                            .toUpperCase();
                        return dayName;
                      }).toList(),
                      isSelected: slot.startDate ==
                          state.selectedDateBasedSlot?.startDate,
                      onTap: () {
                        controller.selectDateBasedSlot(slot);
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
              GlobalSlotBreakDownContainer(
                model: GlobalSlotBreakdownModel(
                  slotDataList: dateWiseSlots.map((e) {
                    return SlotData(
                      //date: e.date,
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
      return const SizedBox();
    }

    if (state.scheduleType == ScheduleType.DurationBased) {
      final slots = state.trainingDetail?.durationBased ?? [];
      final durationWiseSlots = state.selectedDurationBasedSlot?.days ?? [];

      if (slots.isNotEmpty) {
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
                  itemCount: slots.length,
                  itemBuilder: (context, index) {
                    final slot = slots[index];

                    return GlobalSlotItemWidget(
                      showSelectedIcon: false,
                      startDayNumber:
                          (slot.startDate ?? "").dayNumber.toString(),
                      startDayName: (slot.startDate ?? "").dayName,
                      endDayNumber: (slot.endDate ?? "").dayNumber.toString(),
                      endDayName: (slot.endDate ?? "").dayName,
                      dayList: (slot.days ?? []).map((e) {
                        return (e.day ?? "").toUpperCase();
                      }).toList(),
                      isSelected: slot.startDate ==
                          state.selectedDurationBasedSlot?.startDate,
                      onTap: () {
                        controller.selectDurationBasedSlot(slot);
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
              GlobalSlotBreakDownContainer(
                model: GlobalSlotBreakdownModel(
                  slotDataList: durationWiseSlots.map((e) {
                    return SlotData(
                      day: (e.day ?? "").safeSubstring(3).toUpperCase(),
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
      return const SizedBox();
    }

    return const SizedBox();
  }
}
