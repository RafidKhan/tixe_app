import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/global/model/global_response.dart';
import 'package:tixe_flutter_app/modules/auth/personal_details/model/personal_details_request_model.dart';

@immutable
abstract class IPersonalDetailsRepository {
  Future<void> updateRegistrationPersonalInfo({
    required PersonalDetailsRequestModel params,
    required File armsLicense,
    required Function(GlobalResponse? response, bool isSuccess) callBack,
  });
}




