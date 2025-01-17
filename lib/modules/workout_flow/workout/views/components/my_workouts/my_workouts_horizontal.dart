import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout/controller/workout_controller.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../../../../global/widget/training_components/my_training_item_widget_small.dart';
import '../../../../../../utils/enum.dart';
import '../../../../../../utils/navigation.dart';

class MyWorkoutsHorizontal extends ConsumerWidget {
  const MyWorkoutsHorizontal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(workoutController);
    if (state.myWorkouts.isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
      margin: EdgeInsets.only(
        top: 20.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: GlobalText(
                  str: context.loc.my_workouts,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigation.push(
                    appRoutes: AppRoutes.myWorkouts,
                  );
                },
                child: GlobalText(
                  str: context.loc.see_all,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: KColor.btnGradient1.color,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 192.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount:
                  state.myWorkouts.length >= 5 ? 5 : state.myWorkouts.length,
              itemBuilder: (context, index) {
                final data = state.myWorkouts[index];
                return MyTrainingItemWidgetSmall(
                  id: data.id,
                  title: data.title ?? "",
                  image: data.image ?? "",
                  trainingData: null,
                  type: ServiceType.Workout,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 12.w,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
