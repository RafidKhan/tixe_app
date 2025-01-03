import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/training_flow/training/controller/state/training_state.dart';

import '../repository/training_interface.dart';
import '../repository/training_repository.dart';

final trainingController =
    StateNotifierProvider.autoDispose<TrainingController, TrainingState>(
        (ref) => TrainingController());

class TrainingController extends StateNotifier<TrainingState> {
  final ITrainingRepository _trainingRepository = TrainingRepository();


  TrainingController()
      : super(
          TrainingState(
            isLoadingMyTrainings: false,
            myTrainings: [],
            isLoadingTrainings: false,
            trainings: [],
          ),
        );

  void initialize() {
    state = state.copyWith(
      isLoadingMyTrainings: false,
      isLoadingTrainings: false,
      trainings: [],
      myTrainings: [],
    );
  }



  Future<void> callApis() async {
    await getTrainings();
    await getMyTrainings();
  }

  Future<void> getMyTrainings() async {
    state = state.copyWith(isLoadingMyTrainings: true);
    await _trainingRepository.getMyTrainings(
      callback: (response, isSuccess) {
        state = state.copyWith(
          isLoadingMyTrainings: false,
          myTrainings: response?.data?.services ?? [],
        );
      },
    );
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
}
