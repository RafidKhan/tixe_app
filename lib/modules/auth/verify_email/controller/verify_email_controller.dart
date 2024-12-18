import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tixe_flutter_app/modules/auth/verify_email/repository/verify_email_interface.dart';
import 'package:tixe_flutter_app/modules/auth/verify_email/repository/verify_email_repository.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../../../../utils/navigation.dart';
import 'state/verify_email_state.dart';

final verifyEmailController =
    StateNotifierProvider.autoDispose<VerifyEmailController, VerifyEmailState>(
        (ref) => VerifyEmailController());

class VerifyEmailController extends StateNotifier<VerifyEmailState> {
  final IVerifyEmailRepository _verifyEmailRepository = VerifyEmailRepository();
  final TextEditingController otpController = TextEditingController();
  Timer? _timer;

  VerifyEmailController()
      : super(
          const VerifyEmailState(
            isButtonEnabled: false,
            showResendOtpButton: false,
            leftTime: "",
            email: "",
          ),
        ) {
    otpController.addListener(checkButtonStatus);
    startTimer();
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void checkButtonStatus() {
    state =
        state.copyWith(isButtonEnabled: otpController.text.trim().length == 6);
  }

  startTimer() {
    state = state.copyWith(showResendOtpButton: false);
    state = state.copyWith(leftTime: "02:00");
    final DateTime now = DateTime.now();
    late DateTime leftTime;
    leftTime = DateTime(now.year, now.month, now.day, now.hour, 2, 00);

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (time) {
        leftTime = leftTime.subtract(const Duration(seconds: 1));
        state = state.copyWith(leftTime: DateFormat('0m:ss').format(leftTime));
        if (time.tick >= 120) {
          state = state.copyWith(showResendOtpButton: true);
          stopTimer();
        }
      },
    );
  }

  void stopTimer() {
    _timer?.cancel();
  }

  Future<void> verifyRegistrationCode() async {
    ViewUtil.showLoaderPage();
    await _verifyEmailRepository.verifyRegistrationCode(
      email: state.email,
      code: otpController.text.trim(),
      callback: (response, isSuccess) {
        ViewUtil.hideLoader();
        if (isSuccess) {
          Navigation.push(
            appRoutes: AppRoutes.personalDetails,
            arguments: state.email,
          );
        }
      },
    );
  }

  Future<void> resendRegistrationVerificationCode() async {
    startTimer();
    ViewUtil.showLoaderPage();
    await _verifyEmailRepository.resendRegistrationVerificationCode(
      email: state.email,
      callback: (response, isSuccess) {
        ViewUtil.hideLoader();
        if (isSuccess) {
          final message = response?.message;
          if (message != null) {
            ViewUtil.SSLSnackbar(message);
          }
        }
      },
    );
  }
}
