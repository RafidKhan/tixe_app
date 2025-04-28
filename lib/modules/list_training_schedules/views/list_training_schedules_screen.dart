import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_bottom_button.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_slot_item_widget.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../global/model/training_schedule_data.dart';
import '../../../utils/view_util.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class ListTrainingSchedulesScreen extends StatefulWidget {
  final int trainingId;

  const ListTrainingSchedulesScreen({
    super.key,
    required this.trainingId,
  });

  @override
  State<ListTrainingSchedulesScreen> createState() =>
      _ListTrainingSchedulesScreenState();
}

class _ListTrainingSchedulesScreenState
    extends State<ListTrainingSchedulesScreen> {
  List<TrainingScheduleData> schedules = [];

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const GlobalHeaderWidget(
            title: "Listing Trainings",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Column(
                  children: [
                    ListView.separated(
                      itemCount: schedules.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 20.h),
                      itemBuilder: (context, index) {
                        final slot = schedules[index];
                        return GlobalSlotItemWidget(
                          showSelectedIcon: false,
                          startDayNumber:
                              (slot.startDate ?? "").dayNumber.toString(),
                          startDayName: (slot.startDate ?? "").dayName,
                          endDayNumber:
                              (slot.endDate ?? "").dayNumber.toString(),
                          endDayName: (slot.endDate ?? "").dayName,
                          dayList: slot.days,
                          isSelected: false,
                          onTap: null,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10.h);
                      },
                    ),
                    InkWell(
                      onTap: () {
                        Navigation.push(
                          appRoutes: AppRoutes.createTrainingSchedule,
                          arguments: widget.trainingId,
                        ).then((result) {
                          if (result is List<TrainingScheduleData>) {
                            schedules = result;

                            ViewUtil.snackBar(
                              "Schedule Created Successfully",
                              context,
                            );
                            setState(() {});
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: KColor.bodyGradient1.color,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff54534F),
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const GlobalText(
                                  str: "Add A Schedule",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                GlobalText(
                                  str: "Tap here to add a schedule",
                                  color: KColor.grey.color,
                                  fontSize: 9,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GlobalBottomButton(
        onPressed: schedules.isEmpty
            ? null
            : () {
                Navigation.push(
                  appRoutes: AppRoutes.trainingSelectedGearsList,
                  arguments: widget.trainingId,
                );
              },
        buttonText: "Proceed to Next Steps",
      ),
    );
  }
}
