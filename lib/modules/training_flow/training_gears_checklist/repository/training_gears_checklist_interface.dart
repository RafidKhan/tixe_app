import 'package:flutter/material.dart';
import '../model/training_gears_response.dart';

@immutable
abstract class ITrainingGearsChecklistRepository {
  Future<void> getGears({
    required String trainingId,
    required Function(TrainingGearsResponse? response, bool isSuccess) callback,
  });
}




