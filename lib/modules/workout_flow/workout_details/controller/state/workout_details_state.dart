import 'dart:io';

import 'package:tixe_flutter_app/modules/workout_flow/workout_details/model/workout_detail_response.dart';


class WorkoutDetailsState {
  final bool isLoading;
  final int id;
  final WorkoutService? workoutService;
  final WorkoutReviewStatistics? reviewStatistics;
  final File? videoThumbnail;

  const WorkoutDetailsState({
    required this.isLoading,
    required this.id,
    required this.workoutService,
    required this.reviewStatistics,
    required this.videoThumbnail,
  });

  WorkoutDetailsState copyWith({
    bool? isLoading,
    int? id,
    WorkoutService? workoutService,
    WorkoutReviewStatistics? reviewStatistics,
    File? videoThumbnail,
  }) {
    return WorkoutDetailsState(
      isLoading: isLoading ?? this.isLoading,
      id: id ?? this.id,
      workoutService: workoutService ?? this.workoutService,
      reviewStatistics: reviewStatistics ?? this.reviewStatistics,
      videoThumbnail: videoThumbnail ?? this.videoThumbnail,
    );
  }
}
