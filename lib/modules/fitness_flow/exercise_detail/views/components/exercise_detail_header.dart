import 'package:flutter/material.dart';

import '../../../../../global/widget/global_header_widget.dart';

class ExerciseDetailHeader extends StatelessWidget {
  const ExerciseDetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalHeaderWidget(
      title: "Exercise Detail",
    );
  }
}
