import 'package:flutter/material.dart';

@immutable
class VerifyEmailState {
  final bool isButtonEnabled;

  const VerifyEmailState({
    required this.isButtonEnabled,
  });

  VerifyEmailState copyWith({
    bool? isButtonEnabled,
  }) {
    return VerifyEmailState(
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
    );
  }
}
