import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/add_alarm/controller/add_alarm_controller.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class AlarmTimePicker extends ConsumerWidget {
  const AlarmTimePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addAlarmController);
    final controller = ref.read(addAlarmController.notifier);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xff29281E),
            const Color(0xff36352C).withOpacity(0.13),
          ],
        ),
      ),
      child: TimePickerSpinner(
        time: state.dateTime,
        is24HourMode: false,
        normalTextStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: KColor.grey.color),
        highlightedTextStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: KColor.btnGradient1.color),
        spacing: 50,
        itemHeight: 80,
        isForce2Digits: true,
        onTimeChange: (time) {
          controller.setDateTime(time);
        },
      ),
    );
  }
}
