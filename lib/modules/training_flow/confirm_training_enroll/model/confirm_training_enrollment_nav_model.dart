import 'package:tixe_flutter_app/modules/training_flow/training_details/model/training_detail_response.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_gears_checklist/model/custom_gear_data.dart';

class ConfirmTrainingEnrollmentNavModel{
  final TrainingDetail? trainingDetail;
  final ReviewStatistics? reviewStatistics;
  final DurationBased? selectedDurationBasedSlot;
  final DateBased? selectedDateBasedSlot;
  final List<CustomGearData> selectedGears;
  final String gearsFee;
  final String discountAmount;
  final String totalFee;

  const ConfirmTrainingEnrollmentNavModel({
    required this.trainingDetail,
    required this.reviewStatistics,
    required this.gearsFee,
    required this.discountAmount,
    required this.totalFee,
    required this.selectedGears,
    required this.selectedDurationBasedSlot,
    required this.selectedDateBasedSlot,
  });
}