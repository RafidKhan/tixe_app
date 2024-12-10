import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tixe_app/modules/boilerplate/controller/state/boilerplate_state.dart';
import 'package:tixe_app/modules/boilerplate/repository/boilerplate_interface.dart';
import 'package:tixe_app/modules/boilerplate/repository/boilerplate_repository.dart';
import 'package:tixe_app/modules/sign_in/controller/state/sign_in_state.dart';

final signInController =
    StateNotifierProvider.autoDispose<SignInController, SignInState>(
        (ref) => SignInController());

class SignInController extends StateNotifier<SignInState> {
  final IBoilerplateRepository _boilerplateRepository = BoilerplateRepository();

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
