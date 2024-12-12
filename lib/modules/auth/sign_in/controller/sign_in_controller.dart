import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tixe_flutter_app/modules/auth/sign_in/controller/state/sign_in_state.dart';
import 'package:tixe_flutter_app/modules/auth/sign_in/repository/sign_in_interface.dart';
import 'package:tixe_flutter_app/modules/auth/sign_in/repository/sign_in_repository.dart';

final signInController =
    StateNotifierProvider.autoDispose<SignInController, SignInState>(
        (ref) => SignInController());

class SignInController extends StateNotifier<SignInState> {
  final ISignInRepository _signInRepository = SignInRepository();

  final TextEditingController emailOrPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInController()
      : super(
          const SignInState(
            isButtonEnabled: false,
          ),
        ) {
    emailOrPhoneController.addListener(checkButtonStatus);
    passwordController.addListener(checkButtonStatus);
  }

  void checkButtonStatus() {
    state = state.copyWith(
        isButtonEnabled: emailOrPhoneController.text.trim().isNotEmpty &&
            passwordController.text.trim().isNotEmpty);
  }
}
