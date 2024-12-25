import 'package:tixe_flutter_app/utils/enum.dart';

import '../../model/training_detail_response.dart';

class TrainingDetailsState {
  final bool isLoading;
  final int trainingId;
  final int selectedSlotIndex;
  final TrainingDetail? trainingDetail;
  final ScheduleType scheduleType;

  const TrainingDetailsState({
    required this.isLoading,
    required this.trainingId,
    required this.selectedSlotIndex,
    required this.trainingDetail,
    required this.scheduleType,
  });

  TrainingDetailsState copyWith({
    bool? isLoading,
    int? trainingId,
    int? selectedSlotIndex,
    TrainingDetail? trainingDetail,
    ScheduleType? scheduleType,
  }) {
    return TrainingDetailsState(
      isLoading: isLoading ?? this.isLoading,
      trainingId: trainingId ?? this.trainingId,
      trainingDetail: trainingDetail ?? this.trainingDetail,
      selectedSlotIndex: selectedSlotIndex ?? this.selectedSlotIndex,
      scheduleType: scheduleType ?? this.scheduleType,
    );
  }
}