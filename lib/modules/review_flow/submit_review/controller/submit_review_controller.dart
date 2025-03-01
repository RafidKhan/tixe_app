import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/modules/review_flow/submit_review/controller/state/submit_review_state.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../repository/submit_review_interface.dart';
import '../repository/submit_review_repository.dart';

final submitReviewController = StateNotifierProvider.autoDispose<
    SubmitReviewController,
    SubmitReviewState>((ref) => SubmitReviewController());

class SubmitReviewController extends StateNotifier<SubmitReviewState> {
  final ISubmitReviewRepository _submitreviewRepository =
      SubmitReviewRepository();

  final TextEditingController detailController = TextEditingController();

  SubmitReviewController()
      : super(
          SubmitReviewState(
            starStatusList: List<bool>.generate(5, (index) => false),
            isButtonEnabled: false,
          ),
        );

  void checkButtonStatus() {
    final enableStars = state.starStatusList.where((e) => e == true).length;
    state = state.copyWith(
      isButtonEnabled: (enableStars > 0),
    );
  }

  void setStarStatus(int index) {
    final starStatusList = state.starStatusList;
    starStatusList[index] = !starStatusList[index];
    state = state.copyWith(starStatusList: starStatusList);
  }

  void updateRating(int index) {
    final List<bool> ratings = [];
    for (int i = 0; i < state.starStatusList.length; i++) {
      if (i <= index) {
        ratings.add(true);
      } else {
        ratings.add(false);
      }
    }
    state = state.copyWith(starStatusList: ratings);
    checkButtonStatus();
  }
}
