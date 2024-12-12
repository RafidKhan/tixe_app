import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tixe_flutter_app/modules/auth/verify_email/repository/verify_email_interface.dart';
import 'package:tixe_flutter_app/modules/auth/verify_email/repository/verify_email_repository.dart';

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
          ),
        ) {
    otpController.addListener(checkButtonStatus);
    startTimer();
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
}
