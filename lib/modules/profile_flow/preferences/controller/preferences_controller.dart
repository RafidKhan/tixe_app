import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/global/global_module/global_interface.dart';
import 'package:tixe_flutter_app/global/global_module/global_respository.dart';
import 'package:tixe_flutter_app/global/model/global_option_item.dart';
import 'package:tixe_flutter_app/modules/profile_flow/preferences/controller/state/preferences_state.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../../../auth/fitness_details/repository/fitness_details_interface.dart';
import '../../../auth/fitness_details/repository/fitness_details_repository.dart';
import '../repository/preferences_interface.dart';
import '../repository/preferences_repository.dart';

final preferencesController =
    StateNotifierProvider.autoDispose<PreferencesController, PreferencesState>(
        (ref) => PreferencesController());

class PreferencesController extends StateNotifier<PreferencesState> {
  final IFitnessDetailsRepository _fitnessdetailsRepository =
      FitnessDetailsRepository();

  final IPreferencesRepository _preferencesRepository = PreferencesRepository();

  final IGlobalRepository _globalRepository = GlobalRepository();

  final TextEditingController heightUnitController = TextEditingController();
  final TextEditingController weightUnitController = TextEditingController();
  final TextEditingController notificationEndController =
      TextEditingController();

  PreferencesController()
      : super(
          const PreferencesState(
            heightUnit: null,
            weightUnit: null,
            notificationPreference: null,
            heightUnits: [],
            weightUnits: [],
            notificationEnabled: false,
            notificationPreferences: [
              GlobalOptionData(id: 0, value: "1 day"),
              GlobalOptionData(id: 1, value: "2 days"),
              GlobalOptionData(id: 2, value: "3 days"),
              GlobalOptionData(id: 3, value: "Util I Turn On"),
            ],
          ),
        );

  void setHeightUnit(GlobalOptionData option) {
    state = state.copyWith(heightUnit: option);
    heightUnitController.text = option.value;
  }

  void setWeightUnit(GlobalOptionData option) {
    state = state.copyWith(weightUnit: option);
    weightUnitController.text = option.value;
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

  void toggleNotification() {
    state = state.copyWith(notificationEnabled: !state.notificationEnabled);
  }

  void setNotificationData(GlobalOptionData option) {
    state = state.copyWith(notificationPreference: option);
    notificationEndController.text = option.value;
  }
}
