import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../../../../../global/widget/global_header_widget.dart';

class TrainingEnrollmentHeader extends StatelessWidget {
  const TrainingEnrollmentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  GlobalHeaderWidget(
      title: context.loc.enrolling,
    );
  }
}
