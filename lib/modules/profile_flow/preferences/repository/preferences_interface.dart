import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/global/model/global_response.dart';
import 'package:tixe_flutter_app/modules/profile_flow/preferences/model/preference_request.dart';

@immutable
abstract class IPreferencesRepository {
  Future<void> savePreference({
    required PreferenceRequest params,
    required Function(GlobalResponse? data, bool isSuccess) callback,
  });
}




