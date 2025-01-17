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
  final ScrollController scrollControllerMyWorkouts = ScrollController();

  WorkoutController()
      : super(
          const WorkoutState(
            isLoading: false,
            isLoadingMore: false,
            isLoadingMoreMyWorkouts: false,
            isLoadingMyWorkouts: false,
            workoutDataList: [],
            myWorkouts: [],
            page: 1,
            totalDataSize: 0,
            myWorkoutPage: 1,
            totalMyWorkoutDataSize: 0,
          ),
        );

  Future<void> callApi() async {
    initialize();
    await loadWorkouts();
    await getMyWorkouts();
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

  void listenToScrollMyWorkouts() {
    scrollControllerMyWorkouts.addListener(() {
      if (scrollControllerMyWorkouts.position.pixels ==
          scrollControllerMyWorkouts.position.maxScrollExtent) {
        if (state.myWorkouts.length < state.totalMyWorkoutDataSize) {
          loadMoreMyWorkouts();
        }
      }
    });
  }

  void removeScrollListenerMyWorkouts() {
    scrollControllerMyWorkouts.removeListener(() {});
  }

  void initialize() {
    state = state.copyWith(
      isLoading: false,
      isLoadingMore: false,
      workoutDataList: [],
      page: 1,
      totalDataSize: 0,
      myWorkoutPage: 1,
      totalMyWorkoutDataSize: 0,
    );
  }

  Future<void> loadWorkouts() async {
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

  Future<void> getMyWorkouts() async {
    state = state.copyWith(isLoadingMyWorkouts: true);
    await _workoutRepository.getMyWorkouts(
      page: state.myWorkoutPage,
      callback: (response, isSuccess) {
        state = state.copyWith(isLoadingMyWorkouts: false);

        if (isSuccess) {
          state = state.copyWith(
            myWorkouts: response?.data?.services ?? [],
            page: state.myWorkoutPage + 1,
            totalMyWorkoutDataSize:
                response?.data?.pagination?.totalRecords ?? 0,
          );
        }
      },
    );
  }

  Future<void> loadMoreMyWorkouts() async {
    state = state.copyWith(isLoadingMoreMyWorkouts: true);
    await _workoutRepository.getMyWorkouts(
      page: state.myWorkoutPage,
      callback: (response, isSuccess) {
        if (isSuccess) {
          final dataList = response?.data?.services ?? [];
          final existingList = state.myWorkouts;
          final newList = existingList + dataList;
          state = state.copyWith(
            isLoadingMoreMyWorkouts: false,
            myWorkouts: newList,
            myWorkoutPage: state.myWorkoutPage + 1,
          );
        }
      },
    );
  }
}
