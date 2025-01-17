import 'package:tixe_flutter_app/modules/workout_flow/workout/model/workout_list_response.dart';

import '../../model/my_workouts_response.dart';

class WorkoutState {
  final bool isLoading;
  final bool isLoadingMore;
  final bool isLoadingMoreMyWorkouts;
  final bool isLoadingMyWorkouts;
  final List<WorkoutData> workoutDataList;
  final List<MyWorkout> myWorkouts;
  final int page;
  final int totalDataSize;
  final int totalMyWorkoutDataSize;
  final int myWorkoutPage;

  const WorkoutState({
    required this.isLoading,
    required this.isLoadingMore,
    required this.isLoadingMoreMyWorkouts,
    required this.isLoadingMyWorkouts,
    required this.workoutDataList,
    required this.myWorkouts,
    required this.page,
    required this.totalDataSize,
    required this.totalMyWorkoutDataSize,
    required this.myWorkoutPage,
  });

  WorkoutState copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    bool? isLoadingMoreMyWorkouts,
    bool? isLoadingMyWorkouts,
    List<WorkoutData>? workoutDataList,
    List<MyWorkout>? myWorkouts,
    int? page,
    int? totalDataSize,
    int? totalMyWorkoutDataSize,
    int? myWorkoutPage,
  }) {
    return WorkoutState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isLoadingMoreMyWorkouts: isLoadingMoreMyWorkouts ?? this.isLoadingMoreMyWorkouts,
      isLoadingMyWorkouts: isLoadingMyWorkouts ?? this.isLoadingMyWorkouts,
      workoutDataList: workoutDataList ?? this.workoutDataList,
      myWorkouts: myWorkouts ?? this.myWorkouts,
      page: page ?? this.page,
      totalDataSize: totalDataSize ?? this.totalDataSize,
      totalMyWorkoutDataSize: totalMyWorkoutDataSize ?? this.totalMyWorkoutDataSize,
      myWorkoutPage: myWorkoutPage ?? this.myWorkoutPage,
    );
  }
}
