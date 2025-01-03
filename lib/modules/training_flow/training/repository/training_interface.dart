import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/modules/training_flow/training/model/my_trainings_response.dart';

import '../model/training_list_response.dart';

@immutable
abstract class ITrainingRepository {
  Future<void> getMyTrainings({
    required Function(MyTrainingsResponse? response, bool isSuccess) callback,
  });

  Future<void> getTrainings({
    required Function(TrainingListResponse? response, bool isSuccess) callback,
  });
}
