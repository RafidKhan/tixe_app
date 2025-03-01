import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/modules/auth/personal_details/model/personal_detail_nav_model.dart';

import '../../../../../global/model/global_option_item.dart';

@immutable
class FitnessDetailsState {
  final PersonalDetailsNavModel? model;
  final bool isButtonEnabled;
  final GlobalOptionData? heightUnit;
  final GlobalOptionData? weightUnit;
  final List<GlobalOptionData> heightUnits;
  final List<GlobalOptionData> weightUnits;

  const FitnessDetailsState({
    required this.model,
    required this.isButtonEnabled,
    required this.heightUnit,
    required this.weightUnit,
    required this.heightUnits,
    required this.weightUnits,
  });

  FitnessDetailsState copyWith({
    PersonalDetailsNavModel? model,
    bool? isButtonEnabled,
    GlobalOptionData? heightUnit,
    GlobalOptionData? weightUnit,
    List<GlobalOptionData>? heightUnits,
    List<GlobalOptionData>? weightUnits,
  }) {
    return FitnessDetailsState(
      model: model ?? this.model,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      heightUnit: heightUnit ?? this.heightUnit,
      weightUnit: weightUnit ?? this.weightUnit,
      heightUnits: heightUnits ?? this.heightUnits,
      weightUnits: weightUnits ?? this.weightUnits,
    );
  }
}
