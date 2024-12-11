import 'dart:io';

import 'package:flutter/material.dart';

@immutable
class PersonalDetailsState {
  final bool isButtonEnabled;
  final File? armsLicense;

  const PersonalDetailsState({
    required this.isButtonEnabled,
    required this.armsLicense,
  });

  PersonalDetailsState copyWith({
    bool? isButtonEnabled,
    File? armsLicense,
  }) {
    return PersonalDetailsState(
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      armsLicense: armsLicense ?? this.armsLicense,
    );
  }
}
