import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_circular_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_no_data.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/controller/workout_details_controller.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/model/workout_details_nav_model.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/views/components/workout_description.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/views/components/workout_detail_header.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/views/components/workout_gears_and_equipments.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/views/components/workout_price_and_details.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import '../../../../global/widget/global_divider.dart';
import 'components/workout_detail_banners.dart';

class WorkoutDetailsScreen extends StatefulWidget {
  final WorkoutDetailsNavModel navModel;

  const WorkoutDetailsScreen({
    super.key,
    required this.navModel,
  });

  @override
  State<WorkoutDetailsScreen> createState() => _WorkoutDetailsScreenState();
}

class _WorkoutDetailsScreenState extends State<WorkoutDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(workoutDetailsController.notifier);
    Future(() {
      if (widget.navModel.id != null) {
        controller.setWorkoutId(widget.navModel.id!);
        controller.loadWorkoutDetails();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(workoutDetailsController);
      final controller = ref.read(workoutDetailsController.notifier);

      final bool isPremium = state.workoutService?.isPremium == true;

      return TixeMainScaffold(
        hasAppBar: true,
        body: Column(
          children: [
            const WorkoutDetailHeader(),
            Expanded(
              child: state.isLoading
                  ? const GlobalCircularLoader()
                  : state.workoutService == null
                      ? const GlobalNoData()
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              const WorkoutDetailBanners(),
                              SizedBox(height: 20.h),
                              const WorkoutPriceAndDetails(),
                              SizedBox(height: 20.h),
                              SizedBox(height: 10.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: const GlobalDivider(),
                              ),
                              SizedBox(height: 10.h),
                              const WorkoutDescription(),
                              SizedBox(height: 20.h),
                              const WorkoutGearsAndEquipments(),
                              SizedBox(height: 20.h),
                            ],
                          ),
                        ),
            )
          ],
        ),
        bottomNavigationBar: state.workoutService != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GlobalButton(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    onPressed: () {
                      if (isPremium) {
                        Navigation.push(
                          appRoutes: AppRoutes.buyWorkout,
                          arguments: state.workoutService,
                        );
                      } else {
                        controller.enrollmentFreeWorkout();
                      }
                    },
                    buttonText: isPremium
                        ? context.loc.buy_workout
                        : context.loc.add_to_workout_routine,
                  ),
                ],
              )
            : null,
      );
    });
  }
}
