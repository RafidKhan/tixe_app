import 'package:tixe_flutter_app/global/model/global_response.dart';
import 'package:tixe_flutter_app/modules/profile_flow/preferences/model/preference_request.dart';
import 'package:tixe_flutter_app/modules/profile_flow/preferences/repository/preferences_api.dart';

import 'preferences_interface.dart';

class PreferencesRepository implements IPreferencesRepository {
  final PreferencesApi _api = PreferencesApi();

  @override
  Future<void> savePreference({
    required PreferenceRequest params,
    required Function(GlobalResponse? data, bool isSuccess) callback,
  }) async {
    await _api.savePreference(
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
