import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_select_phase/controller/state/my_workout_select_phase_state.dart';

import '../../my_workout_detail/model/my_enrolled_workout_detail_response.dart';
import '../repository/my_workout_select_phase_interface.dart';
import '../repository/my_workout_select_phase_repository.dart';

final myWorkoutSelectPhaseController = StateNotifierProvider.autoDispose<
    MyWorkoutSelectPhaseController,
    MyWorkoutSelectPhaseState>((ref) => MyWorkoutSelectPhaseController());

class MyWorkoutSelectPhaseController
    extends StateNotifier<MyWorkoutSelectPhaseState> {
  final IMyWorkoutSelectPhaseRepository _myworkoutselectphaseRepository =
      MyWorkoutSelectPhaseRepository();

  MyWorkoutSelectPhaseController()
      : super(
          const MyWorkoutSelectPhaseState(
            model: null,
          ),
        );

  void setModel(MyWorkoutData model) {
    state = state.copyWith(model: model);
  }
}
