import 'package:flutter/material.dart';

@immutable
class VerifyEmailState {
  final bool isButtonEnabled;
  final bool showResendOtpButton;
  final String leftTime;

  const VerifyEmailState({
    required this.isButtonEnabled,
    required this.showResendOtpButton,
    required this.leftTime,
  });

  VerifyEmailState copyWith({
    bool? isButtonEnabled,
    bool? showResendOtpButton,
    String? leftTime,
  }) {
    return VerifyEmailState(
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      showResendOtpButton: showResendOtpButton ?? this.showResendOtpButton,
      leftTime: leftTime ?? this.leftTime,
    );
  }
}
