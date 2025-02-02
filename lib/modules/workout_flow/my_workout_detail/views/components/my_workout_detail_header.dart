import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_detail/controller/my_workout_detail_controller.dart';

import '../../../../../global/widget/global_header_widget.dart';

class MyWorkoutDetailHeader extends ConsumerWidget {
  const MyWorkoutDetailHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myWorkoutDetailController);
    return GlobalHeaderWidget(
      title: state.detail?.title ?? "",
    );
  }
}
