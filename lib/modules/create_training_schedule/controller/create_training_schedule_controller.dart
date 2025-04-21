import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

import '../../../utils/navigation.dart';
import '../../../utils/styles/k_colors.dart';
import '../repository/create_training_schedule_interface.dart';
import '../repository/create_training_schedule_repository.dart';
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

  static List<SelectedDay> selectedDays = [
    SelectedDay(
      name: "Monday",
      start: TextEditingController(),
      end: TextEditingController(),
    ),
    SelectedDay(
      name: "Tuesday",
      start: TextEditingController(),
      end: TextEditingController(),
    ),
    SelectedDay(
      name: "Wednesday",
      start: TextEditingController(),
      end: TextEditingController(),
    ),
    SelectedDay(
      name: "Thursday",
      start: TextEditingController(),
      end: TextEditingController(),
    ),
    SelectedDay(
      name: "Friday",
      start: TextEditingController(),
      end: TextEditingController(),
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
  }

  static Future<TimeOfDay?> selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: Navigation.key.currentContext!,
      initialTime: TimeOfDay.now(),
    );
    return pickedTime;
  }
}
