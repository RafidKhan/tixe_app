import 'package:tixe_flutter_app/global/global_module/global_api.dart';

import '../../modules/auth/sign_in/model/sign_in_response.dart';
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

  @override
  Future<void> performSocialLogin({
    required String email,
    required String name,
    required String client,
    required String token,
    required Function(SignInResponse? data, bool isSuccess) callback,
  }) async {
    await _api.performSocialLogin(
      email: email,
      token: token,
      client: client,
      name: name,
      callback: (response, isSuccess) {
        callback(
          isSuccess ? SignInResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }
}
