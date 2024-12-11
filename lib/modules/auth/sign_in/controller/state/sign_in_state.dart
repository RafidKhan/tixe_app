import 'package:flutter/material.dart';

@immutable
class SignInState {
  final bool isButtonEnabled;

  const SignInState({
    required this.isButtonEnabled,
  });

  SignInState copyWith({
    bool? isButtonEnabled,
  }) {
    return SignInState(
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
    );
  }
}
