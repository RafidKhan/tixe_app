import 'package:flutter/material.dart';

@immutable
class VerifyEmailState {
  final bool isButtonEnabled;
  final bool showResendOtpButton;
  final String leftTime;
  final String email;

  const VerifyEmailState({
    required this.isButtonEnabled,
    required this.showResendOtpButton,
    required this.leftTime,
    required this.email,
  });

  VerifyEmailState copyWith({
    bool? isButtonEnabled,
    bool? showResendOtpButton,
    String? leftTime,
    String? email,
  }) {
    return VerifyEmailState(
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      showResendOtpButton: showResendOtpButton ?? this.showResendOtpButton,
      leftTime: leftTime ?? this.leftTime,
      email: email ?? this.email,
    );
  }
}
