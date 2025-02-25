import 'package:tixe_flutter_app/global/global_module/global_api.dart';
import 'package:tixe_flutter_app/global/model/alarm_list_response.dart';

import '../../modules/auth/sign_in/model/sign_in_response.dart';
import '../../modules/training_flow/confirm_training_enroll/model/discount_code_verify_response.dart';
import '../../utils/enum.dart';
import '../model/global_response.dart';
import '../model/profile_response.dart';
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

  @override
  Future<void> verifyDiscountCode({
    required String code,
    required int id,
    required ServiceType type,
    required Function(DiscountCodeVerifyResponse? data, bool isSuccess)
        callback,
  }) async {
    await _api.verifyDiscountCode(
      code: code,
      id: id,
      type: type,
      callback: (response, success) {
        callback(
          success ? DiscountCodeVerifyResponse.fromJson(response?.data) : null,
          success,
        );
      },
    );
  }

  @override
  Future<void> completeWorkoutPhase({
    required String phaseId,
    required Function(GlobalResponse? data, bool isSuccess) callback,
  }) async {
    await _api.completeWorkoutPhase(
      phaseId: phaseId,
      callback: (response, success) {
        callback(
          success ? GlobalResponse.fromJson(response?.data) : null,
          success,
        );
      },
    );
  }

  @override
  Future<void> fetchAlarms({
    required Function(AlarmListResponse? data, bool isSuccess) callback,
  }) async {
    await _api.fetchAlarms(
      callback: (response, isSuccess) {
        callback(
          isSuccess ? AlarmListResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }

  @override
  Future<void> getProfileData({
    required Function(ProfileResponse? data, bool isSuccess) callback,
  }) async {
    await _api.getProfileData(
      callback: (response, isSuccess) {
        callback(isSuccess?ProfileResponse.fromJson(response?.data):null, isSuccess);
      },
    );
  }
}
