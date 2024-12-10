import 'package:flutter/material.dart';

@immutable
class SignUpState {
  final bool isButtonEnabled;

  const SignUpState({
    required this.isButtonEnabled,
  });

  SignUpState copyWith({
    bool? isButtonEnabled,
  }) {
    return SignUpState(
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
    );
  }

}
