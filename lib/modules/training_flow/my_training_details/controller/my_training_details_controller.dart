import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/training_flow/training/model/my_trainings_response.dart';

import 'state/my_training_details_state.dart';

final myTrainingDetailsController = StateNotifierProvider.autoDispose<
    MyTrainingDetailsController,
    MyTrainingDetailsState>((ref) => MyTrainingDetailsController());

class MyTrainingDetailsController
    extends StateNotifier<MyTrainingDetailsState> {
  MyTrainingDetailsController()
      : super(
          const MyTrainingDetailsState(
            trainingDetail: null,
          ),
        );

  void setTrainingData(MyTrainingData model) {
    state = state.copyWith(trainingDetail: model);
  }
}
