import 'package:tixe_flutter_app/modules/training_flow/training_details/model/training_detail_response.dart';

class TrainingGearsChecklistNavModel {
  final TrainingDetail? trainingDetail;
  final ReviewStatistics? reviewStatistics;

  const TrainingGearsChecklistNavModel({
    required this.trainingDetail,
    required this.reviewStatistics,
  });
}