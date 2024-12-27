import 'package:tixe_flutter_app/modules/training_flow/training_details/model/training_detail_response.dart';

class TrainingEnrollmentNavModel {
  final TrainingDetail? trainingDetail;
  final ReviewStatistics? reviewStatistics;

  const TrainingEnrollmentNavModel({
    required this.trainingDetail,
    required this.reviewStatistics,
  });
}