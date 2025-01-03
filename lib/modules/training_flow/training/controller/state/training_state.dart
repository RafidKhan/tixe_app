import 'package:tixe_flutter_app/modules/training_flow/training/model/my_trainings_response.dart';

import '../../model/training_list_response.dart';

class TrainingState {
  final List<MyTrainingData> myTrainings;
  final List<TrainingData> trainings;
  final bool isLoadingMyTrainings;
  final bool isLoadingTrainings;

  TrainingState({
    required this.myTrainings,
    required this.isLoadingMyTrainings,
    required this.isLoadingTrainings,
    required this.trainings,
  });

  TrainingState copyWith({
    List<MyTrainingData>? myTrainings,
    bool? isLoadingMyTrainings,
    bool? isLoadingTrainings,
    List<TrainingData>? trainings,
  }) {
    return TrainingState(
      myTrainings: myTrainings ?? this.myTrainings,
      isLoadingMyTrainings: isLoadingMyTrainings ?? this.isLoadingMyTrainings,
      isLoadingTrainings: isLoadingTrainings ?? this.isLoadingTrainings,
      trainings: trainings ?? this.trainings,
    );
  }
}
