import 'package:tixe_flutter_app/modules/review_flow/review/model/review_nav_model.dart';

class ReviewState{
  final ReviewNavModel? model;

  const ReviewState({
   required this.model,
  });

  ReviewState copyWith({
    ReviewNavModel? model,
  }) {
    return ReviewState(
      model: model ?? this.model,
    );
  }
}