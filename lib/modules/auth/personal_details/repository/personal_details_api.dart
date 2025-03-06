import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

import '../model/personal_details_request_model.dart';

class PersonalDetailsApi {
  final ApiClient _apiClient = ApiClient();

  PersonalDetailsApi();

  Future<void> updateRegistrationPersonalInfo({
    required PersonalDetailsRequestModel params,
    // required File? armsLicense,
    // required File? profilePhoto,
    required Function(Response? response, bool isSuccess) callBack,
  }) async {
    final data = await params.toJson();
    await _apiClient.requestFormDataMultipleFile(
      url: AppUrl.registrationPersonalDetails.url,
      params: data,
      // fileKeyName: armsLicense == null ? null : 'arms_license',
      // files: armsLicense == null ? null : [armsLicense],
      callback: callBack,
      method: Method.POST,
    );
  }
}
