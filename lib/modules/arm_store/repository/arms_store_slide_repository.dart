import 'dart:convert';
import 'dart:developer';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/modules/arm_store/model/arms_store_slide_model.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

class AppStoreSlideRepository {
  final ApiClient _apiClient;

  AppStoreSlideRepository({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  Future<ArmStoreSlideModel?> getSlides() async {
    try {
      ArmStoreSlideModel? slideModel;
      await _apiClient.request(
        url: AppUrl.armsSlideList.url,
        method: Method.GET,
        callback: (response, isSuccess) {
          if (isSuccess && response != null) {
            log("armsList Response ${response.data}");
            slideModel = ArmStoreSlideModel.fromJson(response.data);
          }
        },
      );
      return slideModel;
    } catch (e) {
      throw Exception('Error fetching slides: $e');
    }
  }
}