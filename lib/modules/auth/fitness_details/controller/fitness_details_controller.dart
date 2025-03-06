import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/global/global_module/global_interface.dart';
import 'package:tixe_flutter_app/global/global_module/global_respository.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_controller.dart';
import 'package:tixe_flutter_app/global/model/global_option_item.dart';
import 'package:tixe_flutter_app/modules/auth/fitness_details/controller/state/fitness_details_state.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/mixin/unit_conversion_mixin.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../../../../utils/app_routes.dart';
import '../../../../utils/navigation.dart';
import '../../personal_details/model/personal_detail_nav_model.dart';
import '../model/fitness_details_request.dart';
import '../repository/fitness_details_interface.dart';
import '../repository/fitness_details_repository.dart';

final fitnessDetailsController = StateNotifierProvider.autoDispose<
    FitnessDetailsController,
    FitnessDetailsState>((ref) => FitnessDetailsController());

class FitnessDetailsController extends StateNotifier<FitnessDetailsState>
    with UniConversionMixin {
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
            model: null,
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

  void setModel(PersonalDetailsNavModel model) {
    state = state.copyWith(model: model);
    if (state.model?.actionType == ActionType.Update &&
        state.model?.profileResponse != null) {
      setProfileData();
    }
  }

  void setProfileData() {
    final profileData = state.model?.profileResponse?.data;
    ageController.text = (profileData?.profileDetails?.age ?? "").toString();
    heightController.text = convertHeightToPreferredUnit(
        profileData?.profileDetails?.height ?? "",
        profileData?.profileDetails?.heightUnit ?? "");
    weightController.text = convertWeightToPreferredUnit(
        profileData?.profileDetails?.weight ?? "",
        profileData?.profileDetails?.weightUnit ?? "");
    heightUnitController.text = profileData?.profileDetails?.heightUnit ?? "";
    weightUnitController.text = profileData?.profileDetails?.weightUnit ?? "";
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

    final params = FitnessDetailsRequest(
      email: state.model?.email ?? "",
      age: ageController.text.trim(),
      height: convertToCm(
          heightController.text.trim(), heightUnitController.text.trim()),
      heightUnit: heightUnitController.text.trim(),
      weight: convertToKg(
          weightController.text.trim(), weightUnitController.text.trim()),
      weightUnit: weightUnitController.text.trim(),
    );
    await _fitnessdetailsRepository.updateRegistrationFitnessDetails(
      params: params,
      callback: (response, isSuccess) {
        ViewUtil.hideLoader();
        if (isSuccess) {
          if (state.model?.actionType == ActionType.Registration) {
            Navigation.pushAndRemoveUntil(
              appRoutes: AppRoutes.signIn,
            );
          } else {
            Navigation.key.currentContext!
                .read(sharedController.notifier)
                .getProfileData(showLoader: true)
                .then((value) {
              Navigation.pushAndRemoveUntil(
                appRoutes: AppRoutes.dashboard,
              );
            });
          }
        }
      },
    );
  }
}
