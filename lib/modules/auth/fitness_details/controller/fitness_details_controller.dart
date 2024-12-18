import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/global/global_module/global_interface.dart';
import 'package:tixe_flutter_app/global/global_module/global_respository.dart';
import 'package:tixe_flutter_app/global/model/global_option_item.dart';
import 'package:tixe_flutter_app/modules/auth/fitness_details/controller/state/fitness_details_state.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../../../../utils/app_routes.dart';
import '../../../../utils/navigation.dart';
import '../model/fitness_details_request.dart';
import '../repository/fitness_details_interface.dart';
import '../repository/fitness_details_repository.dart';

final fitnessDetailsController = StateNotifierProvider.autoDispose<
    FitnessDetailsController,
    FitnessDetailsState>((ref) => FitnessDetailsController());

class FitnessDetailsController extends StateNotifier<FitnessDetailsState> {
  final IFitnessDetailsRepository _fitnessdetailsRepository =
      FitnessDetailsRepository();
  final IGlobalRepository _globalRepository = GlobalRepository();

  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightUnitController = TextEditingController();
  final TextEditingController weightUnitController = TextEditingController();

  FitnessDetailsController()
      : super(
          const FitnessDetailsState(
            email: "",
            isButtonEnabled: false,
            heightUnit: null,
            weightUnit: null,
            heightUnits: [],
            weightUnits: [],
          ),
        ) {
    ageController.addListener(checkButtonStatus);
    heightController.addListener(checkButtonStatus);
    weightController.addListener(checkButtonStatus);
    heightUnitController.addListener(checkButtonStatus);
    weightUnitController.addListener(checkButtonStatus);
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

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  Future<void> loadUnitData() async {
    ViewUtil.showLoaderPage();

    await _globalRepository.getSettingsData(
      callback: (response, isSuccess) {
        ViewUtil.hideLoader();
        if (isSuccess) {
          final heightUnits = response?.data?.heightUnit?.options ?? [];
          final weightUnits = response?.data?.weightUnit?.options ?? [];
          state = state.copyWith(
            heightUnits: List.generate(
              heightUnits.length,
              (index) => GlobalOptionData(
                id: index,
                value: heightUnits[index],
              ),
            ),
            weightUnits: List.generate(
              weightUnits.length,
              (index) => GlobalOptionData(
                id: index,
                value: weightUnits[index],
              ),
            ),
          );

          if (state.heightUnits.isNotEmpty) {
            setHeightUnit(state.heightUnits.first);
          }

          if (state.weightUnits.isNotEmpty) {
            setWeightUnit(state.weightUnits.first);
          }
        }
      },
    );
  }

  Future<void> updateRegistrationFitnessDetails() async {
    ViewUtil.showLoaderPage();

    await _fitnessdetailsRepository.updateRegistrationFitnessDetails(
      params: FitnessDetailsRequest(
        email: state.email,
        age: ageController.text.trim(),
        height: heightController.text.trim(),
        heightUnit: heightUnitController.text.trim(),
        weight: weightController.text.trim(),
        weightUnit: weightUnitController.text.trim(),
      ),
      callback: (response, isSuccess) {
        ViewUtil.hideLoader();
        if(isSuccess){
          Navigation.pushAndRemoveUntil(
            appRoutes: AppRoutes.signIn,
          );
        }
      },
    );
  }
}
