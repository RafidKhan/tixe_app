import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../global/widget/global_header_widget.dart';
import '../../controller/training_details_controller.dart';

class TrainingDetailHeader extends ConsumerWidget {
  const TrainingDetailHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(trainingDetailsController);
    return GlobalHeaderWidget(
      title: state.trainingDetail?.title ?? "",
    );
  }
}
