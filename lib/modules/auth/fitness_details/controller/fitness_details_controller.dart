import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/global/model/global_option_item.dart';
import 'package:tixe_flutter_app/modules/auth/fitness_details/controller/state/fitness_details_state.dart';

import '../repository/fitness_details_interface.dart';
import '../repository/fitness_details_repository.dart';

final fitnessDetailsController = StateNotifierProvider.autoDispose<
    FitnessDetailsController,
    FitnessDetailsState>((ref) => FitnessDetailsController());

class FitnessDetailsController extends StateNotifier<FitnessDetailsState> {
  final IFitnessDetailsRepository _fitnessdetailsRepository =
      FitnessDetailsRepository();

  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightUnitController = TextEditingController();
  final TextEditingController weightUnitController = TextEditingController();

  final heightUnits = [
    const GlobalOptionData(
      id: 0,
      value: "CM",
    ),
    const GlobalOptionData(
      id: 1,
      value: "Meter",
    ),
    const GlobalOptionData(
      id: 2,
      value: "Inch",
    ),
    const GlobalOptionData(
      id: 3,
      value: "Feet",
    ),
  ];

  final weightUnits = [
    const GlobalOptionData(
      id: 0,
      value: "Kilograms",
    ),
    const GlobalOptionData(
      id: 1,
      value: "Grams",
    ),
    const GlobalOptionData(
      id: 2,
      value: "Pounds",
    ),
    const GlobalOptionData(
      id: 3,
      value: "Ounces",
    ),
  ];

  FitnessDetailsController()
      : super(
          const FitnessDetailsState(
            isButtonEnabled: false,
            heightUnit: null,
            weightUnit: null,
          ),
        ) {
    ageController.addListener(checkButtonStatus);
    heightController.addListener(checkButtonStatus);
    weightController.addListener(checkButtonStatus);
    heightUnitController.addListener(checkButtonStatus);
    weightUnitController.addListener(checkButtonStatus);
    setHeightUnit(heightUnits.first);
    setWeightUnit(weightUnits.first);
  }

  void checkButtonStatus() {
    state = state.copyWith(
        isButtonEnabled: ageController.text.trim().isNotEmpty &&
            heightController.text.trim().isNotEmpty &&
            weightController.text.trim().isNotEmpty &&
            heightUnitController.text.trim().isNotEmpty &&
            weightUnitController.text.trim().isNotEmpty);
  }

  void setHeightUnit(GlobalOptionData option) {
    state = state.copyWith(heightUnit: option);
    heightUnitController.text = option.value;
  }

  void setWeightUnit(GlobalOptionData option) {
    state = state.copyWith(weightUnit: option);
    weightUnitController.text = option.value;
  }
}
