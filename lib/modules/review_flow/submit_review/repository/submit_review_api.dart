import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

import '/data_provider/api_client.dart';

class SubmitReviewApi {
  final ApiClient _apiClient = ApiClient();

  SubmitReviewApi();

  Future<void> createReview({
    required Map<String, dynamic> params,
    required Function(Response? response, bool isSuccess) callback,
  }) async {
    await _apiClient.request(
      url: AppUrl.createReview.url,
      method: Method.POST,
      params: params,
      callback: callback,
    );
  }

  Future<void> updateReview({
    required int id,
    required Map<String, dynamic> params,
    required Function(Response? response, bool isSuccess) callback,
  }) async {
    await _apiClient.request(
      url: AppUrl.updateReview.url.replaceAll("{ID}", id.toString()),
      method: Method.POST,
      params: params,
      callback: callback,
    );
  }
}
