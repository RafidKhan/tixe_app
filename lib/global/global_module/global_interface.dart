import 'package:tixe_flutter_app/global/model/settings_response.dart';
import 'package:tixe_flutter_app/modules/auth/sign_in/model/sign_in_response.dart';

abstract class IGlobalRepository {
  Future<void> getSettingsData({
    required Function(SettingsResponse? response, bool isSuccess) callback,
  });

  Future<void> performSocialLogin({
    required String email,
    required String name,
    required String client,
    required String token,
    required Function(SignInResponse? data, bool isSuccess) callback,
  });
}
