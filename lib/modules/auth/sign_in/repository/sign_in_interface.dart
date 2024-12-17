import 'package:flutter/material.dart';

import '../model/sign_in_response.dart';

@immutable
abstract class ISignInRepository {
  Future<void> signInUser({
    required String email,
    required String password,
    required Function(SignInResponse? data, bool isSuccess) callback,
  });
}




