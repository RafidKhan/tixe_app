import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../../../global/widget/global_header_widget.dart';

class TrainingDetailHeader extends StatelessWidget {
  const TrainingDetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlobalHeaderWidget(
      title: "Long Range Sniper Training",
    );
  }
}
