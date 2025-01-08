import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../global/widget/global_header_widget.dart';
import '../../controller/my_training_details_controller.dart';

class MyTrainingDetailHeader extends ConsumerWidget {
  const MyTrainingDetailHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myTrainingDetailsController);
    return GlobalHeaderWidget(
      title: state.trainingDetail?.title ?? "",
    );
  }
}
