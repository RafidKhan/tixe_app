import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout/views/components/my_workouts/my_workouts_header.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../../../../../../global/widget/global_circular_loader.dart';
import '../../../../../../global/widget/workout_components/workout_item_widget.dart';
import '../../../controller/workout_controller.dart';

class MyWorkoutsScreen extends StatefulWidget {
  const MyWorkoutsScreen({super.key});

  @override
  State<MyWorkoutsScreen> createState() => _MyWorkoutsScreenState();
}

class _MyWorkoutsScreenState extends State<MyWorkoutsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(workoutController.notifier);
    Future(() {
      controller.listenToScrollMyWorkouts();
    });
  }

  @override
  void dispose() {
    final controller = context.read(workoutController.notifier);
    Future(() {
      controller.removeScrollListenerMyWorkouts();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read(workoutController.notifier);

    return SafeArea(
      child: TixeMainScaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const MyWorkoutsHeader(),
              Expanded(
                child: Consumer(
                  builder: (context, ref, child) {
                    final state = ref.watch(workoutController);
                    if (state.isLoadingMyWorkouts) {
                      return const GlobalCircularLoader();
                    }
                    return ListView.separated(
                      controller: controller.scrollController,
                      itemCount: state.myWorkouts.length,
                      padding: EdgeInsets.only(top: 30.h),
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 20.h);
                      },
                      itemBuilder: (context, index) {
                        final item = state.myWorkouts[index];
                        return WorkoutItemWidget(
                          id: item.id,
                          title: item.title,
                          image: item.image,
                          amount: item.enrollmentFee,
                          shortDescription: item.description,
                          isFree: item.isPremium != true,
                          time: item.duration,
                          calorie: item.calories,
                          isAfterPurchase: true,
                        );
                      },
                    );
                  },
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(workoutController);
                  if (state.isLoadingMoreMyWorkouts) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: const GlobalCircularLoader(),
                    );
                  }
                  return const SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
