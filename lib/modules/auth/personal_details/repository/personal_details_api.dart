import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import '../model/personal_details_request_model.dart';

class PersonalDetailsApi {
  final ApiClient _apiClient = ApiClient();

  PersonalDetailsApi();

  Future<void> updateRegistrationPersonalInfo({
    required PersonalDetailsRequestModel params,
    required File armsLicense,
    required Function(Response? response, bool isSuccess) callBack,
  }) async {
    final data = params.toJson();
    await _apiClient.updatePersonalDetailsRegistration(
      data: data,
      armsLicense: armsLicense,
      callback: callBack,
    );
  }
}
