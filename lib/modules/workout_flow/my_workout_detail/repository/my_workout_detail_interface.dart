import 'package:flutter/material.dart';

import '../model/my_enrolled_workout_detail_response.dart';

@immutable
abstract class IMyWorkoutDetailRepository {
  Future<void> getMyWorkoutDetail({
    required int id,
    required Function(MyEnrolledWorkoutDetail? response, bool isSuccess) callback,
  });
}




