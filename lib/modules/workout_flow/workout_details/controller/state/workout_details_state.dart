import 'package:tixe_flutter_app/modules/workout_flow/workout_details/model/workout_detail_response.dart';


class WorkoutDetailsState {
  final bool isLoading;
  final int workoutId;
  final WorkoutService? workoutService;
  final WorkoutReviewStatistics? reviewStatistics;

  const WorkoutDetailsState({
    required this.isLoading,
    required this.workoutId,
    required this.workoutService,
    required this.reviewStatistics,
  });

  WorkoutDetailsState copyWith({
    bool? isLoading,
    int? workoutId,
    WorkoutService? workoutService,
    WorkoutReviewStatistics? reviewStatistics,
  }) {
    return WorkoutDetailsState(
      isLoading: isLoading ?? this.isLoading,
      workoutId: workoutId ?? this.workoutId,
      workoutService: workoutService ?? this.workoutService,
      reviewStatistics: reviewStatistics ?? this.reviewStatistics,
    );
  }
}
