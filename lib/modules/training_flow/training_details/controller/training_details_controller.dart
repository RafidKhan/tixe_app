import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_details/controller/state/training_details_state.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../model/training_detail_response.dart';
import '../repository/training_details_interface.dart';
import '../repository/training_details_repository.dart';

final trainingDetailsController = StateNotifierProvider.autoDispose<
    TrainingDetailsController,
    TrainingDetailsState>((ref) => TrainingDetailsController());

class TrainingDetailsController extends StateNotifier<TrainingDetailsState> {
  final ITrainingDetailsRepository _trainingdetailsRepository =
      TrainingDetailsRepository();

  TrainingDetailsController()
      : super(
          const TrainingDetailsState(
            isLoading: false,
            trainingId: -1,
            trainingDetail: null,
            reviewStatistics: null,
            selectedDateBasedSlot: null,
            selectedDurationBasedSlot: null,
            scheduleType: ScheduleType.Undefined,
          ),
        );

  void setTrainingId(int id) {
    state = state.copyWith(trainingId: id);
  }

  void setScheduleType() {
    final scheduleType =
        (state.trainingDetail?.scheduleType ?? "").getScheduleType();
    state = state.copyWith(scheduleType: scheduleType);
  }

  Future<void> loadTrainingDetails() async {
    state = state.copyWith(isLoading: true);
    await _trainingdetailsRepository.trainingDetails(
      id: state.trainingId,
      callback: (response, isSuccess) {
        state = state.copyWith(
          isLoading: false,
          trainingDetail: response?.data?.trainingService,
          reviewStatistics: response?.data?.reviewStatistics,
        );
        setScheduleType();
      },
    );
  }

  void selectDateBasedSlot(DateBased dateBased) {
    state = state.copyWith(selectedDateBasedSlot: dateBased);
  }

  void selectDurationBasedSlot(DurationBased durationBased) {
    state = state.copyWith(selectedDurationBasedSlot: durationBased);
  }
}
