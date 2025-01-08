import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/controller/workout_details_controller.dart';

import '../../../../../global/widget/global_header_widget.dart';

class WorkoutDetailHeader extends ConsumerWidget {
  const WorkoutDetailHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(workoutDetailsController);
    return GlobalHeaderWidget(
      title: state.workoutService?.title ?? "",
    );
  }
}
