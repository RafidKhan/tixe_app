import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_controller.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/common_components/exercise_record_tile.dart';
import 'package:tixe_flutter_app/utils/date_util.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class DateBasedExerciseRecord extends StatefulWidget {
  const DateBasedExerciseRecord({super.key});

  @override
  State<DateBasedExerciseRecord> createState() =>
      _DateBasedExerciseRecordState();
}

class _DateBasedExerciseRecordState extends State<DateBasedExerciseRecord> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() {
      final sharedCon = context.read(sharedController.notifier);
      sharedCon.setDate(DateTime.now().subtract(const Duration(days: 1)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(sharedController);
      final sharedCon = ref.read(sharedController.notifier);

      final listData = state.pastExerciseList;
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GlobalText(
                      str: "Past Activity",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    GlobalText(
                      str:
                          DateFormat("dd MMMM yyyy").format(state.pastDateTime),
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: KColor.btnGradient1.color,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  DateUtil.showDatePickerDialog(
                    lastDate: DateTime.now().subtract(const Duration(days: 1)),
                  ).then((dateTime) {
                    if (dateTime != null) {
                      sharedCon.setDate(dateTime);
                    }
                  });
                },
                child: Row(
                  children: [
                    GlobalImageLoader(
                      imagePath: KAssetName.icCalenderYellowPng.imagePath,
                      height: 14.h,
                      width: 14.w,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    GlobalText(
                      str: "Jump to Date",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: KColor.btnGradient1.color,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10.h),
          if (listData.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h),
              child: const GlobalText(
                str: "No record found",
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listData.length,
              itemBuilder: (context, index) {
                final exercise = listData[index];
                return ExerciseRecordTile(exercise: exercise);
              },
            ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: _bottomButton(
                  "Previous",
                  false,
                  onTap: () {
                    sharedCon.getPastDayData();
                  },
                ),
              ),
              if (state.pastDateTime.day != DateTime.now().day - 1) ...[
                SizedBox(width: 60.w),
                Expanded(
                  child: _bottomButton(
                    "Next",
                    true,
                    onTap: () {
                      sharedCon.getNextDayData();
                    },
                  ),
                ),
              ],
            ],
          )
        ],
      );
    });
  }

  Widget _bottomButton(
    String title,
    bool isNext, {
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: KColor.btnGradient1.color),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!isNext) ...[
              GlobalImageLoader(
                imagePath: KAssetName.icBackFilledPng.imagePath,
                height: 12.h,
              ),
              SizedBox(
                width: 4.w,
              ),
            ],
            GlobalText(
              str: title,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            if (isNext) ...[
              SizedBox(
                width: 4.w,
              ),
              GlobalImageLoader(
                imagePath: KAssetName.icForwardFilledPng.imagePath,
                height: 12.h,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
