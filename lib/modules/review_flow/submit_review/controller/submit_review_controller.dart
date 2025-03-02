import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/global/model/create_review_model.dart';
import 'package:tixe_flutter_app/modules/review_flow/submit_review/controller/state/submit_review_state.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../model/submit_review_nav_model.dart';
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
            model: null,
          ),
        );

  void setModel(SubmitReviewNavModel model) {
    state = state.copyWith(model: model);
    if (state.model?.isUpdate == true) {
      final rating = state.model!.review?.rating ?? 0;
      final comment = state.model!.review?.comment ?? "";
      if ((rating) > 0) {
        updateRating((rating - 1).toInt());
      }
      if (comment.trim().isNotEmpty) {
        detailController.text = comment;
      }
    }
  }

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

  Future<void> submitReview() async {
    ViewUtil.showLoaderPage();
    await _submitreviewRepository.createReview(
      params: getParams(),
      callback: (response, isSuccess) async {
        ViewUtil.hideLoader();
        Navigation.pop();
        Navigation.pop(result: true);
        final message = response?.message;
        if (isSuccess && message != null) {
          ViewUtil.snackBar(message);
        }
      },
    );
  }

  Future<void> updateReview() async {
    ViewUtil.showLoaderPage();
    await _submitreviewRepository.updateReview(
      id: state.model!.review!.reviewId!,
      params: getParams(),
      callback: (response, isSuccess) async {
        ViewUtil.hideLoader();
        Navigation.pop();
        Navigation.pop(result: true);
        final message = response?.message;
        if (isSuccess && message != null) {
          ViewUtil.snackBar(message);
        }
      },
    );
  }

  CreateReviewRequest getParams() {
    String serviceType = ""; //training //fitness
    if (state.model?.serviceType == ServiceType.Workout) {
      serviceType = "workout";
    } else if (state.model?.serviceType == ServiceType.Fitness) {
      serviceType = "fitness";
    } else if (state.model?.serviceType == ServiceType.Training) {
      serviceType = "training";
    }
    final params = CreateReviewRequest(
      serviceType: serviceType,
      rating: state.starStatusList.where((e) => e == true).length,
      comment: detailController.text,
      serviceId: state.model!.serviceId,
    );
    'here is: ${jsonEncode(params.toJson())}'.log();
    return params;
  }
}
