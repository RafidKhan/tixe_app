import 'package:flutter/cupertino.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_gears_checklist/model/training_gears_checklist_nav_model.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_gears_checklist/views/training_gears_checklist_screen.dart';

import '../../model/custom_gear_data.dart';

class TrainingGearsChecklistState {
  final TrainingGearsChecklistNavModel? model;
  final List<CustomGearData> allGears;
  final List<CustomGearData> selectedGears;
  final bool isButtonEnabled;

  const TrainingGearsChecklistState({
    required this.model,
    required this.allGears,
    required this.selectedGears,
    required this.isButtonEnabled,
  });

  TrainingGearsChecklistState copyWith({
    TrainingGearsChecklistNavModel? model,
    List<CustomGearData>? allGears,
    List<CustomGearData>? selectedGears,
    bool? isButtonEnabled,
  }) {
    return TrainingGearsChecklistState(
      model: model ?? this.model,
      allGears: allGears ?? this.allGears,
      selectedGears: selectedGears ?? this.selectedGears,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
    );
  }
}
