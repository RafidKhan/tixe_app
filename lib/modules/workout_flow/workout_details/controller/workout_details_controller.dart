import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/repository/workout_details_interface.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/repository/workout_details_repository.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../../../../utils/app_routes.dart';
import '../../../../utils/navigation.dart';
import '../model/workout_enrollment_request.dart';
import 'state/workout_details_state.dart';

final workoutDetailsController = StateNotifierProvider.autoDispose<
    WorkoutDetailsController,
    WorkoutDetailsState>((ref) => WorkoutDetailsController());

class WorkoutDetailsController extends StateNotifier<WorkoutDetailsState> {
  final IWorkoutDetailsRepository _workoutRepository =
      WorkoutDetailsRepository();

  WorkoutDetailsController()
      : super(
          const WorkoutDetailsState(
            isLoading: false,
            workoutId: -1,
            workoutService: null,
            reviewStatistics: null,
            reviewList: [],
          ),
        );

  void setWorkoutId(int id) {
    state = state.copyWith(workoutId: id);
  }

  Future<void> loadWorkoutDetails() async {
    state = state.copyWith(isLoading: true);
    await _workoutRepository.workoutDetails(
      id: state.workoutId,
      callback: (response, isSuccess) async {
        state = state.copyWith(
          isLoading: false,
          workoutService: response?.data?.workoutService,
          reviewStatistics: response?.data?.reviewStatistics,
          reviewList: response?.data?.reviewList ?? [],
        );
      },
    );
  }

  Future<void> enrollmentFreeWorkout(BuildContext context) async {
    ViewUtil.showLoaderPage();
    final params = WorkoutEnrollmentRequest(
      workoutServiceId: state.workoutId,
      paymentId: null,
      trainingFee: null,
      conveiences: null,
      discountAmount: null,
      grandTotal: null,
    );
    await _workoutRepository.enrollFreeWorkout(
      params: params,
      callback: (response, isSuccess) async {
        ViewUtil.hideLoader();
        final message = response?.message;
        if (message != null) {
          ViewUtil.snackBar(message,context);
        }
        if (isSuccess) {
          Navigation.pushAndRemoveUntil(appRoutes: AppRoutes.dashboard);
        }
      },
    );
  }
}
