import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

import '../../../utils/navigation.dart';
import '../../../utils/styles/k_colors.dart';
import '../views/components/date_based_fields.dart';
import '../views/components/duration_based_fields.dart';

class CrtTrSchdlController {
  static Widget titleWidget(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: GlobalText(
        str: text,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: KColor.grey.color,
      ),
    );
  }

  static ScheduleType? selectedScheduleType;
  static TextEditingController scheduleNameController = TextEditingController();
  static TextEditingController startDate = TextEditingController();
  static TextEditingController endDate = TextEditingController();

  static setSelectedScheduleType(ScheduleType type) {
    selectedScheduleType = type;
    if (type == ScheduleType.DateBased) {
      scheduleNameController.text = "Date Based";
    } else {
      scheduleNameController.text = "Duration Based";
    }
  }

  static List<SelectedDayData> selectedDays = [
    SelectedDayData(
      name: "Monday",
      start: TextEditingController(),
      end: TextEditingController(),
    ),
    SelectedDayData(
      name: "Tuesday",
      start: TextEditingController(),
      end: TextEditingController(),
    ),
    SelectedDayData(
      name: "Wednesday",
      start: TextEditingController(),
      end: TextEditingController(),
    ),
    SelectedDayData(
      name: "Thursday",
      start: TextEditingController(),
      end: TextEditingController(),
    ),
    SelectedDayData(
      name: "Friday",
      start: TextEditingController(),
      end: TextEditingController(),
    ),
  ];
  static List<DateBasedData> dateBasedFields = [
    DateBasedData(
      dateController: TextEditingController(),
      startTimeController: TextEditingController(),
      endTimeController: TextEditingController(),
    ),
  ];

  static clearAllData() {
    selectedScheduleType = null;
    scheduleNameController.clear();
    startDate.clear();
    endDate.clear();
    selectedDays.forEach((day) {
      day.start.clear();
      day.end.clear();
      day.isSelected = false;
    });
    dateBasedFields = [
      DateBasedData(
        dateController: TextEditingController(),
        startTimeController: TextEditingController(),
        endTimeController: TextEditingController(),
      ),
    ];
  }

  static Future<TimeOfDay?> selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: Navigation.key.currentContext!,
      initialTime: TimeOfDay.now(),
    );
    return pickedTime;
  }
}
