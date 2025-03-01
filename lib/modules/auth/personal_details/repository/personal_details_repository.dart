import 'dart:io';

import 'package:tixe_flutter_app/global/model/global_response.dart';
import 'package:tixe_flutter_app/modules/auth/personal_details/model/personal_details_request_model.dart';

import 'personal_details_api.dart';
import 'personal_details_interface.dart';

class PersonalDetailsRepository implements IPersonalDetailsRepository {
  final _api = PersonalDetailsApi();

  @override
  Future<void> updateRegistrationPersonalInfo({
    required PersonalDetailsRequestModel params,
    required File? armsLicense,
    required Function(GlobalResponse? response, bool isSuccess) callBack,
  }) async {
    await _api.updateRegistrationPersonalInfo(
      params: params,
      armsLicense: armsLicense,
      callBack: (response, isSuccess) {
        callBack(
          isSuccess ? GlobalResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }
}
