import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/repository/workout_details_interface.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/repository/workout_details_repository.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
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
            id: -1,
            workoutService: null,
            reviewStatistics: null,
            videoThumbnail: null,
          ),
        );

  void setWorkoutId(int id) {
    state = state.copyWith(id: id);
  }

  Future<void> loadWorkoutDetails() async {
    state = state.copyWith(isLoading: true);
    await _workoutRepository.workoutDetails(
      id: state.id,
      callback: (response, isSuccess) async {
        state = state.copyWith(
          isLoading: false,
          workoutService: response?.data?.workoutService,
          reviewStatistics: response?.data?.reviewStatistics,
        );
        if (state.workoutService?.video != null) {
          state = state.copyWith(
              videoThumbnail: await (state.workoutService?.video ?? "")
                  .getThumbnailFromVideo(maxHeight: 200));
        }
      },
    );
  }
}
