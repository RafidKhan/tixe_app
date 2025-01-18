import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_detail/views/components/workout_history_item.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../../../global/widget/global_text.dart';
import '../../controller/my_workout_detail_controller.dart';

class MyWorkoutDetailHistory extends ConsumerWidget {
  const MyWorkoutDetailHistory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myWorkoutDetailController);
    final history = state.history;

    if (history.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GlobalText(
                  str: context.loc.workout_history,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              InkWell(
                onTap: () =>
                    Navigation.push(appRoutes: AppRoutes.allWorkoutHistory),
                child: GlobalText(
                  str: context.loc.see_all,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: KColor.btnGradient1.color,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          ListView.separated(
            itemCount: history.length >= 3 ? 3 : history.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10.h,
              );
            },
            itemBuilder: (context, index) {
              final item = history[index];
              return WorkoutHistoryItem(
                date: (item.completedDate ?? "").dayNumber,
                day: (item.completedDate ?? "").dayName,
                title: item.title ?? "",
                duration: (item.durationTime ?? "0").toString(),
                calorie: (item.cal ?? "0").toString(),
              );
            },
          )
        ],
      ),
    );
  }
}
