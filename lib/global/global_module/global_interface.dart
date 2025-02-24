import 'package:dio/dio.dart';
import 'package:tixe_flutter_app/global/model/alarm_list_response.dart';
import 'package:tixe_flutter_app/global/model/global_response.dart';
import 'package:tixe_flutter_app/global/model/settings_response.dart';
import 'package:tixe_flutter_app/modules/auth/sign_in/model/sign_in_response.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

import '../../modules/training_flow/confirm_training_enroll/model/discount_code_verify_response.dart';

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

  Future<void> verifyDiscountCode({
    required String code,
    required int id,
    required ServiceType type,
    required Function(DiscountCodeVerifyResponse? data, bool isSuccess)
        callback,
  });

  Future<void> completeWorkoutPhase({
    required String phaseId,
    required Function(GlobalResponse? data, bool isSuccess) callback,
  });

  Future<void> fetchAlarms({
    required Function(AlarmListResponse? data, bool isSuccess) callback,
  });
}
