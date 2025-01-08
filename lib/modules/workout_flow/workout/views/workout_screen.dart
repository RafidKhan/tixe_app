import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_circular_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_no_data.dart';
import 'package:tixe_flutter_app/global/widget/workout_components/workout_item_widget.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout/controller/workout_controller.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout/views/components/workout_header.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(workoutController.notifier);
    Future(() {
      controller.callApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read(workoutController.notifier);

    return SafeArea(
      child: Scaffold(
        backgroundColor: KColor.transparent.color,
        body: Consumer(builder: (context, ref, child) {
          final state = ref.watch(workoutController);
          if (state.isLoading) {
            return const GlobalCircularLoader();
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                const WorkoutHeader(),
                Expanded(
                  child: state.workoutDataList.isEmpty
                      ? const GlobalNoData()
                      : ListView.separated(
                          controller: controller.scrollController,
                          itemCount: state.workoutDataList.length,
                          padding: EdgeInsets.only(top: 30.h),
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 20.h);
                          },
                          itemBuilder: (context, index) {
                            final item = state.workoutDataList[index];

                            return WorkoutItemWidget(
                              id: item.id,
                              title: item.title,
                              image: item.image,
                              amount: item.enrollmentFee,
                              shortDescription: item.description,
                              isFree: item.isPremium != true,
                              time: item.duration,
                              calorie: item.calories,
                            );
                          },
                        ),
                ),
                if (state.isLoadingMore)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: const GlobalCircularLoader(),
                  )
              ],
            ),
          );
        }),
      ),
    );
  }
}
