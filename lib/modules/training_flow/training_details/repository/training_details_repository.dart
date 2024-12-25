import 'package:tixe_flutter_app/modules/training_flow/training_details/repository/training_details_api.dart';

import '../model/training_detail_response.dart';
import 'training_details_interface.dart';

class TrainingDetailsRepository implements ITrainingDetailsRepository {
  final TrainingDetailsApi _api = TrainingDetailsApi();

  @override
  Future<void> trainingDetails({
    required int id,
    required Function(TrainingDetailResponse? response, bool isSuccess)
        callback,
  }) async {
    await _api.trainingDetails(
      id: id,
      callback: (response, inSuccess) {
        callback(
          inSuccess ? TrainingDetailResponse.fromJson(response?.data) : null,
          inSuccess,
        );
      },
    );
  }
}
