import 'package:tixe_flutter_app/modules/training_flow/confirm_training_enroll/model/confirm_training_enrollment_nav_model.dart';

class ConfirmTrainingEnrollmentState{
  final ConfirmTrainingEnrollmentNavModel? model;
  final String discountValue;
  final String totalValue;

  const ConfirmTrainingEnrollmentState({
   required this.model,
   required this.discountValue,
   required this.totalValue,
  });


  ConfirmTrainingEnrollmentState copyWith({
    ConfirmTrainingEnrollmentNavModel? model,
    String? discountValue,
    String? totalValue,
  }) {
    return ConfirmTrainingEnrollmentState(
      model: model ?? this.model,
      discountValue: discountValue ?? this.discountValue,
      totalValue: totalValue ?? this.totalValue,
    );
  }


}