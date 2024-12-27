import 'package:tixe_flutter_app/modules/training_flow/confirm_training_enroll/model/confirm_training_enrollment_nav_model.dart';

class ConfirmTrainingEnrollmentState{
  final ConfirmTrainingEnrollmentNavModel? model;

  const ConfirmTrainingEnrollmentState({
   required this.model,
  });


  ConfirmTrainingEnrollmentState copyWith({
    ConfirmTrainingEnrollmentNavModel? model,
  }) {
    return ConfirmTrainingEnrollmentState(
      model: model ?? this.model,
    );
  }


}