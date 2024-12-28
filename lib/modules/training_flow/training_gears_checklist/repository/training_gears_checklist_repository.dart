import 'package:tixe_flutter_app/modules/training_flow/training_gears_checklist/repository/training_gears_checklist_api.dart';
import '../model/training_gears_response.dart';
import 'training_gears_checklist_interface.dart';

class TrainingGearsChecklistRepository
    implements ITrainingGearsChecklistRepository {
  final TrainingGearsChecklistApi _api = TrainingGearsChecklistApi();

  @override
  Future<void> getGears({
    required String trainingId,
    required Function(TrainingGearsResponse? response, bool isSuccess) callback,
  }) async {
    await _api.getGears(
      trainingId: trainingId,
      callback: (response, isSuccess) {
        callback(
          isSuccess ? TrainingGearsResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }
}
