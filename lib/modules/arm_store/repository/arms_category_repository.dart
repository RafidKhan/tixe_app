import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/modules/arm_store/model/arms_category_model.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart'; // For .log() extension

class ArmsCategoryRepository {
  final ApiClient _apiClient;

  ArmsCategoryRepository({required ApiClient apiClient})
      : _apiClient = apiClient;

  Future<ArmsCategoryModel> fetchArmsCategories() async {
    try {
      ArmsCategoryModel? armsCategoryModel;
      bool isSuccess = false;

      await _apiClient.request(
        url: 'arms/categories',
        method: Method.GET,
        callback: (Response? response, bool success) {
          isSuccess = success;
          if (success && response != null && response.data != null) {
            // Log raw response data
            'Raw API Response: ${jsonEncode(response.data)}'.log();

            armsCategoryModel = ArmsCategoryModel.fromJson(response.data);

            // Log parsed ArmsCategoryModel
            'Parsed ArmsCategoryModel: ${armsCategoryModel!.toJson()}'.log();

            // Optionally, log specific fields
            if (armsCategoryModel!.data != null) {
              for (var category in armsCategoryModel!.data!) {
                'Category: id=${category.id}, name=${category.name}, image=${category.image}'.log();
              }
            }
          } else {
            'API Request Failed: No data or success=false'.log();
          }
        },
      );

      if (isSuccess && armsCategoryModel != null) {
        return armsCategoryModel!;
      } else {
        throw Exception('Failed to fetch arms categories');
      }
    } catch (e) {
      'Error fetching categories: $e'.log();
      throw Exception('Failed to fetch categories: $e');
    }
  }
}