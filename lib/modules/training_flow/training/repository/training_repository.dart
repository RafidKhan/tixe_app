import 'package:tixe_flutter_app/modules/training_flow/training/model/my_trainings_response.dart';
import 'package:tixe_flutter_app/modules/training_flow/training/model/training_list_response.dart';
import 'package:tixe_flutter_app/modules/training_flow/training/repository/training_api.dart';

import 'training_interface.dart';

class TrainingRepository implements ITrainingRepository {
  final TrainingApi _api = TrainingApi();

  @override
  Future<void> getMyTrainings({
    required Function(MyTrainingsResponse? response, bool isSuccess) callback,
  }) async {
    await _api.getMyTrainings(
      callback: (response, isSuccess) {
        callback(
          isSuccess ? MyTrainingsResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }

  @override
  Future<void> getTrainings({
    required Function(TrainingListResponse? response, bool isSuccess) callback,
  }) async {
    await _api.getTrainings(
      callback: (response, isSuccess) {
        callback(
          isSuccess ? TrainingListResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }
}
