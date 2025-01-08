import 'package:flutter/material.dart';

import '../model/sign_up_response.dart';

@immutable
abstract class ISignUpRepository {
  Future<void> signUpUser({
    required String email,
    required String password,
    required String confirmPassword,
    required Function(SignUpResponse? data, bool isSuccess) callback,
  });
}




