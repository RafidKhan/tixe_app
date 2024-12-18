import 'package:tixe_flutter_app/global/global_module/global_api.dart';

import '../model/settings_response.dart';
import 'global_interface.dart';

class GlobalRepository extends IGlobalRepository {
  final GlobalApi _api = GlobalApi();

  @override
  Future<void> getSettingsData({
    required Function(SettingsResponse? response, bool isSuccess) callback,
  }) async {
    await _api.getSettingsData(
      callback: (response, isSuccess) {
        callback(
          isSuccess ? SettingsResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }
}
