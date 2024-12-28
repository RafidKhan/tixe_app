import 'package:tixe_flutter_app/modules/training_flow/training_details/model/training_detail_response.dart';

import '../../../training_gears_checklist/model/custom_gear_data.dart';
import '../../model/training_enrollment_nav_model.dart';

class TrainingEnrollmentState {
  final DateBased? selectedDateBasedSlot;
  final DurationBased? selectedDurationBasedSlot;
  final TrainingEnrollmentNavModel? model;
  final String totalAmount;
  final String totalGearAmount;
  final bool isButtonEnabled;
  final List<CustomGearData> selectedGears;

  const TrainingEnrollmentState({
    required this.selectedDateBasedSlot,
    required this.selectedDurationBasedSlot,
    required this.model,
    required this.totalAmount,
    required this.totalGearAmount,
    required this.isButtonEnabled,
    required this.selectedGears,
  });

  TrainingEnrollmentState copyWith({
    DateBased? selectedDateBasedSlot,
    DurationBased? selectedDurationBasedSlot,
    TrainingEnrollmentNavModel? model,
    String? totalAmount,
    String? totalGearAmount,
    bool? isButtonEnabled,
    List<CustomGearData>? selectedGears,
  }) {
    return TrainingEnrollmentState(
      selectedDateBasedSlot:
          selectedDateBasedSlot ?? this.selectedDateBasedSlot,
      selectedDurationBasedSlot:
          selectedDurationBasedSlot ?? this.selectedDurationBasedSlot,
      model: model ?? this.model,
      totalAmount: totalAmount ?? this.totalAmount,
      totalGearAmount: totalGearAmount ?? this.totalGearAmount,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      selectedGears: selectedGears ?? this.selectedGears,
    );
  }
}
