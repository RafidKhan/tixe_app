import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tixe_app/modules/auth/sign_up/controller/state/sign_up_state.dart';
import 'package:tixe_app/modules/auth/sign_up/repository/sign_up_interface.dart';
import 'package:tixe_app/modules/auth/sign_up/repository/sign_up_repository.dart';

final signUpController =
    StateNotifierProvider.autoDispose<SignUpController, SignUpState>(
        (ref) => SignUpController());

class SignUpController extends StateNotifier<SignUpState> {
  final ISignUpRepository _signUpRepository = SignUpRepository();

  final TextEditingController emailOrPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  SignUpController()
      : super(
          const SignUpState(
            isButtonEnabled: false,
          ),
        ) {
    emailOrPhoneController.addListener(checkButtonStatus);
    passwordController.addListener(checkButtonStatus);
    confirmPasswordController.addListener(checkButtonStatus);
  }

  void checkButtonStatus() {
    state = state.copyWith(
        isButtonEnabled: emailOrPhoneController.text.trim().isNotEmpty &&
            passwordController.text.trim().isNotEmpty &&
            confirmPasswordController.text.trim() ==
                passwordController.text.trim());
  }
}
