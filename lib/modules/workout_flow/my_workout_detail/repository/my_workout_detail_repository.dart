import '../model/my_enrolled_workout_detail_response.dart';
import 'my_workout_detail_api.dart';
import 'my_workout_detail_interface.dart';

class MyWorkoutDetailRepository implements IMyWorkoutDetailRepository {
  final MyWorkoutDetailApi _api = MyWorkoutDetailApi();

  @override
  Future<void> getMyWorkoutDetail({
    required int id,
    required Function(MyEnrolledWorkoutDetail? response, bool isSuccess)
        callback,
  }) async {
    await _api.getMyWorkoutDetail(
      id: id,
      callback: (response, isSuccess) {
        callback(
          isSuccess ? MyEnrolledWorkoutDetail.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }
}
