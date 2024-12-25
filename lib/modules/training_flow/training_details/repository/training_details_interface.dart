import 'package:flutter/material.dart';

import '../model/training_detail_response.dart';

@immutable
abstract class ITrainingDetailsRepository {
  Future<void> trainingDetails({
    required int id,
    required Function(TrainingDetailResponse? response, bool isSuccess) callback,
  });
}




