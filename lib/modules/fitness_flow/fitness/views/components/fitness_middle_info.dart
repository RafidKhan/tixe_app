import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/fitness/views/components/fitness_activity_graph.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/fitness/views/components/fitness_heart_rate_graph.dart';

class FitnessMiddleInfo extends StatelessWidget {
  const FitnessMiddleInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const FitnessActivityGraph(),
        SizedBox(
          width: 20.w,
        ),
        const FitnessHeartRateGraph(),
      ],
    );
  }

}
