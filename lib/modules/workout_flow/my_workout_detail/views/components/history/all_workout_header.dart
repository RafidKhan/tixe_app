import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../../../../../../global/widget/global_header_widget.dart';

class AllWorkoutHeader extends ConsumerWidget {
  const AllWorkoutHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GlobalHeaderWidget(
      title: context.loc.workout_history,
    );
  }
}
