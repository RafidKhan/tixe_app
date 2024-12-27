import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_gears_checklist/repository/training_gears_checklist_api.dart';

import 'training_gears_checklist_interface.dart';

class TrainingGearsChecklistRepository
    implements ITrainingGearsChecklistRepository {
  final TrainingGearsChecklistApi _api = TrainingGearsChecklistApi();

  @override
  Future<void> getGears({
    required Function(Response? response, bool isSuccess) callback,
  }) async {
    await _api.getGears(
      callback: (response, isSuccess) {
        callback(
          isSuccess ? response : null,
          isSuccess,
        );
      },
    );
  }
}
