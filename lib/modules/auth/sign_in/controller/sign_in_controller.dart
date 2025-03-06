import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tixe_flutter_app/constant/constant_key.dart';
import 'package:tixe_flutter_app/data_provider/pref_helper.dart';
import 'package:tixe_flutter_app/modules/auth/sign_in/controller/state/sign_in_state.dart';
import 'package:tixe_flutter_app/modules/auth/sign_in/repository/sign_in_interface.dart';
import 'package:tixe_flutter_app/modules/auth/sign_in/repository/sign_in_repository.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../../../../utils/app_routes.dart';

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
    if (kDebugMode) {
      emailOrPhoneController.text = "rafidKhan3@gmail.com";
      passwordController.text = "12345678";
    }
  }

  void checkButtonStatus() {
    state = state.copyWith(
        isButtonEnabled: emailOrPhoneController.text.trim().isNotEmpty &&
            passwordController.text.trim().isNotEmpty);
  }

  Future<void> signInUser() async {
    ViewUtil.showLoaderPage();
    await _signInRepository.signInUser(
      email: emailOrPhoneController.text.trim(),
      password: passwordController.text.trim(),
      callback: (data, isSuccess) async {
        ViewUtil.hideLoader();
        if (isSuccess) {
          await PrefHelper.setString(AppConstant.TOKEN.key, data?.token ?? "")
              .then(
            (value) {
              Navigation.pushAndRemoveUntil(
                appRoutes: AppRoutes.dashboard,
              );
            },
          );
        }
      },
    );
  }
}
