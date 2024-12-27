import 'package:tixe_flutter_app/modules/training_flow/training_details/model/training_detail_response.dart';

import '../../model/training_enrollment_nav_model.dart';

class TrainingEnrollmentState {
  final DateBased? selectedDateBasedSlot;
  final DurationBased? selectedDurationBasedSlot;
  final TrainingEnrollmentNavModel? model;
  final String totalAmount;
  final bool isButtonEnabled;

  const TrainingEnrollmentState({
    required this.selectedDateBasedSlot,
    required this.selectedDurationBasedSlot,
    required this.model,
    required this.totalAmount,
    required this.isButtonEnabled,
  });

  TrainingEnrollmentState copyWith({
    DateBased? selectedDateBasedSlot,
    DurationBased? selectedDurationBasedSlot,
    TrainingEnrollmentNavModel? model,
    String? totalAmount,
    bool? isButtonEnabled,
  }) {
    return TrainingEnrollmentState(
      selectedDateBasedSlot:
          selectedDateBasedSlot ?? this.selectedDateBasedSlot,
      selectedDurationBasedSlot:
          selectedDurationBasedSlot ?? this.selectedDurationBasedSlot,
      model: model ?? this.model,
      totalAmount: totalAmount ?? this.totalAmount,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
    );
  }
}
