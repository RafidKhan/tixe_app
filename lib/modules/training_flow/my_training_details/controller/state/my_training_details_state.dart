import '../../../training/model/my_trainings_response.dart';


class MyTrainingDetailsState {
  final MyTrainingData? trainingDetail;

  const MyTrainingDetailsState({
    required this.trainingDetail,
  });

  MyTrainingDetailsState copyWith({
    MyTrainingData? trainingDetail,
  }) {
    return MyTrainingDetailsState(
      trainingDetail: trainingDetail ?? this.trainingDetail,
    );
  }
}
