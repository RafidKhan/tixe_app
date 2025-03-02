import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/global/model/create_review_model.dart';
import 'package:tixe_flutter_app/global/model/global_response.dart';

@immutable
abstract class ISubmitReviewRepository {
  Future<void> createReview({
    required CreateReviewRequest params,
    required Function(GlobalResponse? response, bool isSuccess) callback,
  });

  Future<void> updateReview({
    required int id,
    required CreateReviewRequest params,
    required Function(GlobalResponse? response, bool isSuccess) callback,
  });
}




