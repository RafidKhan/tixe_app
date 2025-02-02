import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../controller/workout_details_controller.dart';

class WorkoutGearsAndEquipments extends ConsumerWidget {
  const WorkoutGearsAndEquipments({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(workoutDetailsController);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            str: context.loc.gears_equipments,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: KColor.white.color,
          ),
          SizedBox(height: 20.h),
          GlobalText(
            str: state.workoutService?.gearEquipment ?? "",
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: KColor.white.color,
          ),
        ],
      ),
    );
  }
}
