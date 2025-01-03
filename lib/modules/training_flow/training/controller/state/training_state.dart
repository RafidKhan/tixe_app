import 'package:tixe_flutter_app/modules/training_flow/training/model/my_trainings_response.dart';

import '../../model/training_list_response.dart';

class TrainingState {
  final List<MyTrainingData> myTrainings;
  final List<TrainingData> trainings;
  final bool isLoadingMyTrainings;
  final bool isLoadingTrainings;
  final bool isLoadingMoreMyTrainings;
  final int page;
  final int totalDataSize;

  TrainingState({
    required this.myTrainings,
    required this.isLoadingMyTrainings,
    required this.isLoadingTrainings,
    required this.trainings,
    required this.isLoadingMoreMyTrainings,
    required this.page,
    required this.totalDataSize,
  });

  TrainingState copyWith({
    List<MyTrainingData>? myTrainings,
    bool? isLoadingMyTrainings,
    bool? isLoadingTrainings,
    bool? isLoadingMoreMyTrainings,
    List<TrainingData>? trainings,
    int? page,
    int? totalDataSize,
  }) {
    return TrainingState(
      myTrainings: myTrainings ?? this.myTrainings,
      isLoadingMyTrainings: isLoadingMyTrainings ?? this.isLoadingMyTrainings,
      isLoadingTrainings: isLoadingTrainings ?? this.isLoadingTrainings,
      trainings: trainings ?? this.trainings,
      isLoadingMoreMyTrainings: isLoadingMoreMyTrainings ?? this.isLoadingMoreMyTrainings,
      page: page ?? this.page,
      totalDataSize: totalDataSize ?? this.totalDataSize,
    );
  }
}
