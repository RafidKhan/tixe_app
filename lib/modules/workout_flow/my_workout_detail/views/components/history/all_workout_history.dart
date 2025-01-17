import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_detail/controller/my_workout_detail_controller.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import '../../../../../../global/widget/scaffold/tixe_main_scaffold.dart';
import '../workout_history_item.dart';
import 'all_workout_header.dart';

class AllWorkoutHistory extends ConsumerWidget {
  const AllWorkoutHistory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myWorkoutDetailController);
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const AllWorkoutHeader(),
          SizedBox(
            height: 6.h,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: state.history.length,
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 16.h,
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 20.h,
              ),
              itemBuilder: (context, index) {
                final item = state.history[index];
                return WorkoutHistoryItem(
                  date: (item.completedDate ?? "").dayNumber,
                  day: (item.completedDate ?? "").dayName,
                  title: item.title ?? "",
                  duration: (item.durationTime ?? "0").toString(),
                  calorie: (item.cal ?? "0").toString(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
