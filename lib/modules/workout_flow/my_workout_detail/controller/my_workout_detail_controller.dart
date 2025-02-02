import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_detail/controller/state/my_workout_detail_state.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../model/my_enrolled_workout_detail_response.dart';
import '../repository/my_workout_detail_interface.dart';
import '../repository/my_workout_detail_repository.dart';

final myWorkoutDetailController = StateNotifierProvider.autoDispose<
    MyWorkoutDetailController,
    MyWorkoutDetailState>((ref) => MyWorkoutDetailController());

class MyWorkoutDetailController extends StateNotifier<MyWorkoutDetailState> {
  final IMyWorkoutDetailRepository _myworkoutdetailRepository =
      MyWorkoutDetailRepository();

  MyWorkoutDetailController()
      : super(
          MyWorkoutDetailState(
            detail: null,
            history: [],
          ),
        );

  Future<void> getMyWorkoutDetail(int id) async {
    ViewUtil.showLoaderPage();
    await _myworkoutdetailRepository.getMyWorkoutDetail(
      id: id,
      callback: (response, isSuccess) async {
        ViewUtil.hideLoader();
        if (isSuccess) {
          final List<WorkoutPhase> history =
              (response?.data?.workoutPhase ?? [])
                  .where((e) => e.isCompleted == 1)
                  .toList();
          state = state.copyWith(
            detail: response?.data,
            history: history,
          );
        }
      },
    );
  }
}
