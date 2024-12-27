import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../../../global/model/global_slot_breakdown_model.dart';
import '../../../../../global/widget/global_slot_breakdown_container.dart';
import '../../../../../global/widget/global_slot_item_widget.dart';
import '../../../../../utils/enum.dart';
import '../../controller/training_enrollment_controller.dart';

class TrainingEnrollmentAvailableSlots extends ConsumerWidget {
  const TrainingEnrollmentAvailableSlots({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(trainingEnrollmentController);
    final controller = ref.read(trainingEnrollmentController.notifier);
    final scheduleType =
        (state.model?.trainingDetail?.scheduleType ?? "").getScheduleType();

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
          if (scheduleType == ScheduleType.DateBased) ...[
            Builder(builder: (context) {
              final slots = state.model?.trainingDetail?.dateBased ?? [];

              final dateWiseSlots = state.selectedDateBasedSlot?.dates ?? [];

              return ListView.builder(
                itemCount: slots.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final slot = slots[index];
                  return Column(
                    children: [
                      GlobalSlotItemWidget(
                        showSelectedIcon: true,
                        startDayNumber: (slot.startDate ?? "").dayNumber.toString(),
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
                      ),

                      Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          if (slot.startDate ==
                              state.selectedDateBasedSlot?.startDate) ...[
                            Column(
                              children: [
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
                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            ),
                          ]
                        ],
                      )
                    ],
                  );
                },
              );
            })
          ],
          if (scheduleType == ScheduleType.DurationBased) ...[
            Builder(builder: (context) {
              final slots = state.model?.trainingDetail?.durationBased ?? [];
              final durationWiseSlots =
                  state.selectedDurationBasedSlot?.days ?? [];
              return ListView.builder(
                itemCount: slots.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final slot = slots[index];
                  return Column(
                    children: [
                      GlobalSlotItemWidget(
                        showSelectedIcon: true,
                        startDayNumber: (slot.startDate ?? "").dayNumber.toString(),
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
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          if (slot.startDate ==
                              state.selectedDurationBasedSlot?.startDate) ...[
                            Column(
                              children: [
                                GlobalSlotBreakDownContainer(
                                  model: GlobalSlotBreakdownModel(
                                    slotDataList: durationWiseSlots.map((e) {
                                      return SlotData(
                                        day: (e.day ?? "")
                                            .safeSubstring(3)
                                            .toUpperCase(),
                                        startTime: e.startAt ?? "",
                                        endTime: e.endAt ?? "",
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            ),
                          ]
                        ],
                      )
                    ],
                  );
                },

              );
            })
          ],
        ],
      ),
    );
  }
}
