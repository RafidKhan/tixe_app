import 'package:tixe_flutter_app/global/global_module/global_interface.dart';
import 'package:tixe_flutter_app/global/global_module/global_respository.dart';
import 'package:tixe_flutter_app/global/widget/phase_complete_widget.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_detail/model/my_enrolled_workout_detail_response.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

class MyWorkoutPdfController {
  final IGlobalRepository _globalRepository = GlobalRepository();

  Future<void> completeWorkoutPhase({required WorkoutPhase phase}) async {
    ViewUtil.showLoaderPage();
    await _globalRepository.completeWorkoutPhase(
      phaseId: phase.id.toString(),
      callback: (response, isSuccess) {
        ViewUtil.hideLoader();
        if (isSuccess) {
          final message = (response?.message ?? "").trim();
          if (message.isNotEmpty) {
            ViewUtil.bottomSheet(
              isDismissible: false,
              enableDrag: false,
              content: PhaseCompleteWidget(
                phase: phase,
              ),
            );
          }
        }
      },
    );
  }
}
