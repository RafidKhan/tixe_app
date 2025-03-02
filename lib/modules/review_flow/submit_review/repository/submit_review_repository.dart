import 'package:tixe_flutter_app/global/model/create_review_model.dart';
import 'package:tixe_flutter_app/global/model/global_response.dart';
import 'package:tixe_flutter_app/modules/review_flow/submit_review/repository/submit_review_api.dart';

import 'submit_review_interface.dart';

class SubmitReviewRepository implements ISubmitReviewRepository {
  final SubmitReviewApi _api = SubmitReviewApi();

  @override
  Future<void> createReview({
    required CreateReviewRequest params,
    required Function(GlobalResponse? response, bool isSuccess) callback,
  }) async {
    await _api.createReview(
      params: params.toJson(),
      callback: (response, isSuccess) {
        callback(
          isSuccess ? GlobalResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }

  @override
  Future<void> updateReview({
    required int id,
    required CreateReviewRequest params,
    required Function(GlobalResponse? response, bool isSuccess) callback,
  }) async {
    await _api.updateReview(
      id: id,
      params: params.toJson(),
      callback: (response, isSuccess) {
        callback(
          isSuccess ? GlobalResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }
}
