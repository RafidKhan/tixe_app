import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tixe_app/modules/auth/verify_email/repository/verify_email_interface.dart';
import 'package:tixe_app/modules/auth/verify_email/repository/verify_email_repository.dart';

import 'state/verify_email_state.dart';

final verifyEmailController =
    StateNotifierProvider.autoDispose<VerifyEmailController, VerifyEmailState>(
        (ref) => VerifyEmailController());

class VerifyEmailController extends StateNotifier<VerifyEmailState> {
  final IVerifyEmailRepository _verifyEmailRepository = VerifyEmailRepository();
  final TextEditingController otpController = TextEditingController();

  VerifyEmailController()
      : super(
          const VerifyEmailState(
            isButtonEnabled: false,
          ),
        ) {
    otpController.addListener(checkButtonStatus);
  }

  void checkButtonStatus() {
    state =
        state.copyWith(isButtonEnabled: otpController.text.trim().length == 6);
  }
}
