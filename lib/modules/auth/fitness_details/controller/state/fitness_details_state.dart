import 'package:flutter/material.dart';

import '../../../../../global/model/global_option_item.dart';

@immutable
class FitnessDetailsState {
  final bool isButtonEnabled;
  final GlobalOptionData? heightUnit;
  final GlobalOptionData? weightUnit;

  const FitnessDetailsState({
    required this.isButtonEnabled,
    required this.heightUnit,
    required this.weightUnit,
  });

  FitnessDetailsState copyWith({
    bool? isButtonEnabled,
    GlobalOptionData? heightUnit,
    GlobalOptionData? weightUnit,
  }) {
    return FitnessDetailsState(
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      heightUnit: heightUnit ?? this.heightUnit,
      weightUnit: weightUnit ?? this.weightUnit,
    );
  }
}
