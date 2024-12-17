import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tixe_flutter_app/modules/auth/sign_up/controller/state/sign_up_state.dart';
import 'package:tixe_flutter_app/modules/auth/sign_up/repository/sign_up_interface.dart';
import 'package:tixe_flutter_app/modules/auth/sign_up/repository/sign_up_repository.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

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

  Future<void> signUpUser() async {
    ViewUtil.showLoaderPage();

    await _signUpRepository.signUpUser(
      email: emailOrPhoneController.text.trim(),
      password: passwordController.text.trim(),
      confirmPassword: confirmPasswordController.text.trim(),
      callback: (response, isSuccess) {
        ViewUtil.hideLoader();
        if (isSuccess) {
          final message = response?.message;
          if (message != null) {
            ViewUtil.SSLSnackbar(message);
            Navigation.push(
              appRoutes: AppRoutes.verifyEmail,
              arguments: emailOrPhoneController.text.trim(),
            );
          }
        }
      },
    );
  }
}
