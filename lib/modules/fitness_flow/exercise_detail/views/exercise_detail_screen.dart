import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/common_components/fitness_exercise_info.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/exercise_detail/views/components/date_based_exercise_record.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/exercise_detail/views/components/exercise_detail_header.dart';

class ExerciseDetailScreen extends StatelessWidget {
  const ExerciseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const ExerciseDetailHeader(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 16.h,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const FitnessExerciseInfo(
                      onTapDetail: null,
                      showAll: true,
                    ),
                    SizedBox(height: 20.h),
                    const DateBasedExerciseRecord(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
