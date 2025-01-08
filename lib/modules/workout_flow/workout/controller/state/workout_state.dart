import 'package:tixe_flutter_app/modules/workout_flow/workout/model/workout_list_response.dart';

class WorkoutState {
  final bool isLoading;
  final bool isLoadingMore;
  final List<WorkoutData> workoutDataList;
  final int page;
  final int totalDataSize;

  const WorkoutState({
    required this.isLoading,
    required this.isLoadingMore,
    required this.workoutDataList,
    required this.page,
    required this.totalDataSize,
  });

  WorkoutState copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    List<WorkoutData>? workoutDataList,
    int? page,
    int? totalDataSize,
  }) {
    return WorkoutState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      workoutDataList: workoutDataList ?? this.workoutDataList,
      page: page ?? this.page,
      totalDataSize: totalDataSize ?? this.totalDataSize,
    );
  }
}
