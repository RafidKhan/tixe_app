import 'package:tixe_flutter_app/utils/enum.dart';

import '../../model/training_detail_response.dart';

class TrainingDetailsState {
  final bool isLoading;
  final int trainingId;
  final TrainingDetail? trainingDetail;
  final ReviewStatistics? reviewStatistics;
  final ScheduleType scheduleType;
  final DateBased? selectedDateBasedSlot;
  final DurationBased? selectedDurationBasedSlot;

  const TrainingDetailsState({
    required this.isLoading,
    required this.trainingId,
    required this.trainingDetail,
    required this.scheduleType,
    required this.selectedDateBasedSlot,
    required this.selectedDurationBasedSlot,
    required this.reviewStatistics,
  });

  TrainingDetailsState copyWith({
    bool? isLoading,
    int? trainingId,
    TrainingDetail? trainingDetail,
    ScheduleType? scheduleType,
    DateBased? selectedDateBasedSlot,
    DurationBased? selectedDurationBasedSlot,
    ReviewStatistics? reviewStatistics,
  }) {
    return TrainingDetailsState(
      isLoading: isLoading ?? this.isLoading,
      trainingId: trainingId ?? this.trainingId,
      trainingDetail: trainingDetail ?? this.trainingDetail,
      scheduleType: scheduleType ?? this.scheduleType,
      selectedDateBasedSlot:
          selectedDateBasedSlot ?? this.selectedDateBasedSlot,
      selectedDurationBasedSlot:
          selectedDurationBasedSlot ?? this.selectedDurationBasedSlot,
      reviewStatistics: reviewStatistics ?? this.reviewStatistics,
    );
  }
}
