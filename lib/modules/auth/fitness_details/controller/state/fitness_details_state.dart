import 'package:flutter/material.dart';

import '../../../../../global/model/global_option_item.dart';

@immutable
class FitnessDetailsState {
  final String email;
  final bool isButtonEnabled;
  final GlobalOptionData? heightUnit;
  final GlobalOptionData? weightUnit;
  final List<GlobalOptionData> heightUnits;
  final List<GlobalOptionData> weightUnits;

  const FitnessDetailsState({
    required this.email,
    required this.isButtonEnabled,
    required this.heightUnit,
    required this.weightUnit,
    required this.heightUnits,
    required this.weightUnits,
  });

  FitnessDetailsState copyWith({
    String? email,
    bool? isButtonEnabled,
    GlobalOptionData? heightUnit,
    GlobalOptionData? weightUnit,
    List<GlobalOptionData>? heightUnits,
    List<GlobalOptionData>? weightUnits,
  }) {
    return FitnessDetailsState(
      email: email ?? this.email,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      heightUnit: heightUnit ?? this.heightUnit,
      weightUnit: weightUnit ?? this.weightUnit,
      heightUnits: heightUnits ?? this.heightUnits,
      weightUnits: weightUnits ?? this.weightUnits,
    );
  }
}
