import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/global/model/global_response.dart';

@immutable
abstract class IVerifyEmailRepository {
  Future<void> verifyRegistrationCode({
    required String email,
    required String code,
    required Function(Response? data, bool isSuccess) callback,
  });

  Future<void> resendRegistrationVerificationCode({
    required String email,
    required Function(GlobalResponse? data, bool isSuccess) callback,
  });
}




