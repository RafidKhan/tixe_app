import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout/repository/workout_interface.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout/repository/workout_repository.dart';
import 'state/workout_state.dart';

final workoutController =
    StateNotifierProvider<WorkoutController, WorkoutState>(
        (ref) => WorkoutController());

class WorkoutController extends StateNotifier<WorkoutState> {
  final IWorkoutRepository _workoutRepository = WorkoutRepository();

  final ScrollController scrollController = ScrollController();

  WorkoutController()
      : super(
          const WorkoutState(
            isLoading: false,
            isLoadingMore: false,
            workoutDataList: [],
            page: 1,
            totalDataSize: 0,
          ),
        );

  Future<void> callApi() async {
    initialize();
    await loadHomeData();
    listenToPagination();
  }

  listenToPagination() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (state.workoutDataList.length < state.totalDataSize) {
          loadMoreHomeData();
        }
      }
    });
  }

  void initialize() {
    state = state.copyWith(
      isLoading: false,
      isLoadingMore: false,
      workoutDataList: [],
      page: 1,
      totalDataSize: 0,
    );
  }

  Future<void> loadHomeData() async {
    state = state.copyWith(isLoading: true);
    await _workoutRepository.getWorkouts(
      page: state.page,
      callback: (response, isSuccess) {
        state = state.copyWith(
          isLoading: false,
          workoutDataList: response?.data?.services ?? [],
          page: state.page + 1,
          totalDataSize: response?.data?.pagination?.totalRecords ?? 0,
        );
      },
    );
  }

  Future<void> loadMoreHomeData() async {
    state = state.copyWith(isLoadingMore: true);

    await _workoutRepository.getWorkouts(
      page: state.page,
      callback: (response, isSuccess) {
        final dataList = response?.data?.services ?? [];
        final existingList = state.workoutDataList;
        final newList = existingList + dataList;
        state = state.copyWith(
          isLoadingMore: false,
          workoutDataList: newList,
          page: state.page + 1,
        );
      },
    );
  }
}
