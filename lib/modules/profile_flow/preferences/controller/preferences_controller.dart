import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/global/global_module/global_interface.dart';
import 'package:tixe_flutter_app/global/global_module/global_respository.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_controller.dart';
import 'package:tixe_flutter_app/global/model/global_option_item.dart';
import 'package:tixe_flutter_app/modules/profile_flow/preferences/controller/state/preferences_state.dart';
import 'package:tixe_flutter_app/modules/profile_flow/preferences/model/preference_request.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
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
  final TextEditingController distanceUnitController = TextEditingController();
  final TextEditingController notificationEndController =
      TextEditingController();

  PreferencesController()
      : super(
          const PreferencesState(
            heightUnit: null,
            weightUnit: null,
            distanceUnit: null,
            notificationPreference: null,
            heightUnits: [],
            weightUnits: [],
            distanceUnits: [],
            notificationEnabled: false,
            isButtonEnabled: false,
            notificationPreferences: [],
          ),
        ) {
    heightUnitController.addListener(checkButtonStatus);
    weightUnitController.addListener(checkButtonStatus);
    distanceUnitController.addListener(checkButtonStatus);
    notificationEndController.addListener(checkButtonStatus);
  }

  void checkButtonStatus() {
    if (state.notificationEnabled) {
      state = state.copyWith(
        isButtonEnabled: heightUnitController.text.trim().isNotEmpty &&
            weightUnitController.text.trim().isNotEmpty &&
            distanceUnitController.text.trim().isNotEmpty,
      );
    } else {
      state = state.copyWith(
        isButtonEnabled: heightUnitController.text.trim().isNotEmpty &&
            weightUnitController.text.trim().isNotEmpty &&
            distanceUnitController.text.trim().isNotEmpty &&
            notificationEndController.text.trim().isNotEmpty,
      );
    }
  }

  void setHeightUnit(GlobalOptionData option) {
    state = state.copyWith(heightUnit: option);
    heightUnitController.text = option.value;
  }

  void setWeightUnit(GlobalOptionData option) {
    state = state.copyWith(weightUnit: option);
    weightUnitController.text = option.value;
  }

  void setDistanceUnit(GlobalOptionData option) {
    state = state.copyWith(distanceUnit: option);
    distanceUnitController.text = option.value;
  }

  Future<void> loadUnitData() async {
    ViewUtil.showLoaderPage();

    await _globalRepository.getSettingsData(
      callback: (response, isSuccess) {
        ViewUtil.hideLoader();
        if (isSuccess) {
          final heightUnits = response?.data?.heightUnit?.options ?? [];
          final weightUnits = response?.data?.weightUnit?.options ?? [];
          final distanceUnits = response?.data?.distanceUnit?.options ?? [];
          final notificationPreferences =
              response?.data?.notificationPreferences?.options ?? [];
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
            distanceUnits: List.generate(
              distanceUnits.length,
              (index) => GlobalOptionData(
                id: index,
                value: distanceUnits[index],
              ),
            ),
            notificationPreferences: List.generate(
              notificationPreferences.length,
              (index) => GlobalOptionData(
                id: notificationPreferences[index].id,
                value: notificationPreferences[index].value ?? "",
              ),
            ),
          );

          final myProfileData = Navigation.key.currentContext!
              .read(sharedController.notifier)
              .getProfileDataFromState();
          if (state.heightUnits.isNotEmpty) {
            if (myProfileData?.data?.profileDetails?.heightUnit != null) {
              final myHeightUnit = state.heightUnits
                  .where((element) =>
                      element.value ==
                      myProfileData?.data?.profileDetails?.heightUnit)
                  .firstOrNull;
              if (myHeightUnit != null) {
                setHeightUnit(myHeightUnit);
              }
            }
          }

          if (state.weightUnits.isNotEmpty) {
            if (myProfileData?.data?.profileDetails?.heightUnit != null) {
              final myWeightUnit = state.weightUnits
                  .where((element) =>
                      element.value ==
                      myProfileData?.data?.profileDetails?.weightUnit)
                  .firstOrNull;
              if (myWeightUnit != null) {
                setWeightUnit(myWeightUnit);
              }
            }
          }

          if (state.distanceUnits.isNotEmpty) {
            if (myProfileData?.data?.profileDetails?.distanceUnit != null) {
              final myDistanceUnit = state.distanceUnits
                  .where((element) =>
              element.value ==
                  myProfileData?.data?.profileDetails?.distanceUnit)
                  .firstOrNull;
              if (myDistanceUnit != null) {
                setDistanceUnit(myDistanceUnit);
              }
            }
          }
        }
      },
    );
  }

  void setNotificationStatus({int? currentStatus}) {
    if (currentStatus == 1) {
      state = state.copyWith(notificationEnabled: true);
    } else if (currentStatus == 0) {
      state = state.copyWith(notificationEnabled: false);
    }
  }

  void toggleNotification() {
    state = state.copyWith(notificationEnabled: !state.notificationEnabled);
    checkButtonStatus();
  }

  void setNotificationData(GlobalOptionData option) {
    state = state.copyWith(notificationPreference: option);
    notificationEndController.text = option.value;
  }

  Future<void> savePreference(BuildContext context) async {
    ViewUtil.showLoaderPage();

    final params = PreferenceRequest(
      heightUnit: heightUnitController.text.trim(),
      weightUnit: weightUnitController.text.trim(),
      distanceUnit: distanceUnitController.text.trim(),
      notificationEnabled: state.notificationEnabled ? 1 : 0,
      notificationTurnOffFor: state.notificationEnabled
          ? null
          : state.notificationPreference?.id.toString()
    );

    await _preferencesRepository.savePreference(
      params: params,
      callback: (response, isSuccess) {
        ViewUtil.hideLoader();

        if (isSuccess && response?.message != null) {
          ViewUtil.snackBar(response?.message ?? "",context);
          Navigation.key.currentContext!
              .read(sharedController.notifier)
              .getProfileData(
                showLoader: true,
              );
        }
      },
    );
  }
}
