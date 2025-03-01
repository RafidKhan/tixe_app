import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/review_flow/review/controller/state/review_state.dart';

import '../model/review_nav_model.dart';
import '../repository/review_interface.dart';
import '../repository/review_repository.dart';

final reviewController =
    StateNotifierProvider.autoDispose<ReviewController, ReviewState>(
        (ref) => ReviewController());

class ReviewController extends StateNotifier<ReviewState> {
  final IReviewRepository _reviewRepository = ReviewRepository();

  ReviewController()
      : super(
          const ReviewState(model: null),
        );

  void setModel(ReviewNavModel model) {
    state = state.copyWith(model: model);
  }
}
