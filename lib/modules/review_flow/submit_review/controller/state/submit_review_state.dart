import 'package:tixe_flutter_app/modules/review_flow/submit_review/model/submit_review_nav_model.dart';

class SubmitReviewState{
  final List<bool> starStatusList;
  final bool isButtonEnabled;
  final SubmitReviewNavModel? model;

  const SubmitReviewState({
    required this.starStatusList,
    required this.isButtonEnabled,
    required this.model,
  });

  SubmitReviewState copyWith({
    List<bool>? starStatusList,
    bool? isButtonEnabled,
    SubmitReviewNavModel? model,
  }) {
    return SubmitReviewState(
      starStatusList: starStatusList ?? this.starStatusList,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      model: model ?? this.model,
    );
  }
}