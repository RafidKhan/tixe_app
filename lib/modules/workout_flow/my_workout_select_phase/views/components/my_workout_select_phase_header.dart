import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_select_phase/controller/my_workout_select_phase_controller.dart';

import '../../../../../global/widget/global_header_widget.dart';

class MyWorkoutSelectPhaseHeader extends ConsumerWidget {
  const MyWorkoutSelectPhaseHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myWorkoutSelectPhaseController);
    return GlobalHeaderWidget(
      title: state.model?.title ?? "",
    );
  }
}
