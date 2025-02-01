import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/data_provider/pref_helper.dart';
import 'package:tixe_flutter_app/modules/training_flow/training/controller/state/training_state.dart';

import '../repository/training_interface.dart';
import '../repository/training_repository.dart';

final trainingController =
    StateNotifierProvider<TrainingController, TrainingState>(
        (ref) => TrainingController());

class TrainingController extends StateNotifier<TrainingState> {
  final ITrainingRepository _trainingRepository = TrainingRepository();
  final ScrollController scrollController = ScrollController();

  TrainingController()
      : super(
          TrainingState(
            isLoadingMyTrainings: false,
            myTrainings: [],
            isLoadingTrainings: false,
            trainings: [],
            isLoadingMoreMyTrainings: false,
            totalDataSize: 0,
            page: 1,
          ),
        );

  void listenToScroll() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (state.myTrainings.length < state.totalDataSize) {
          getMoreMyTrainings();
        }
      }
    });
  }

  void removeScrollListener() {
    scrollController.removeListener(() {});
  }

  void initialize() {
    state = state.copyWith(
      isLoadingMyTrainings: false,
      isLoadingTrainings: false,
      trainings: [],
      myTrainings: [],
      isLoadingMoreMyTrainings: false,
      page: 1,
      totalDataSize: 0,
    );
  }

  Future<void> callApis() async {
    await getTrainings();
    await getMyTrainings();
  }

  Future<void> getMyTrainings() async {
    if(PrefHelper.getLoginStatus()){
      state = state.copyWith(isLoadingMyTrainings: true);
      await _trainingRepository.getMyTrainings(
        callback: (response, isSuccess) {
          state = state.copyWith(
            isLoadingMyTrainings: false,
            myTrainings: (response?.data?.services ?? []),
            page: state.page + 1,
            totalDataSize: response?.data?.pagination?.totalRecords ?? 0,
          );
        },
      );
    }

  }

  Future<void> getTrainings() async {
    state = state.copyWith(isLoadingTrainings: true);
    await _trainingRepository.getTrainings(
      callback: (response, isSuccess) {
        state = state.copyWith(
          isLoadingTrainings: false,
          trainings: response?.data ?? [],
        );
      },
    );
  }

  Future<void> getMoreMyTrainings() async {
    state = state.copyWith(isLoadingMoreMyTrainings: true);
    await _trainingRepository.getMyTrainings(
      callback: (response, isSuccess) {
        final dataList = response?.data?.services ?? [];
        final existingList = state.myTrainings;
        final newList = existingList + dataList;
        state = state.copyWith(
          isLoadingMoreMyTrainings: false,
          myTrainings: newList,
          page: state.page + 1,
        );
      },
    );
  }
}
