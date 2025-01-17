import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_divider.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_select_phase/controller/my_workout_select_phase_controller.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_select_phase/views/components/my_workout_phase_item.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class MyWorkoutPhases extends ConsumerWidget {
  const MyWorkoutPhases({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myWorkoutSelectPhaseController);
    final phases = state.model?.workoutPhase ?? [];
    return ListView.separated(
      shrinkWrap: true,
      itemCount: phases.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        top: 20.h,
        bottom: 20.h,
      ),
      separatorBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: const GlobalDivider(),
        );
      },
      itemBuilder: (context, index) {
        final phase = phases[index];
        return MyWorkoutPhaseItem(
          phase: phase,
        );
      },
    );
  }
}
