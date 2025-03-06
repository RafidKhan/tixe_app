import 'package:country_state_city/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_controller.dart';
import 'package:tixe_flutter_app/global/model/global_option_item.dart';
import 'package:tixe_flutter_app/modules/auth/personal_details/model/personal_detail_nav_model.dart';
import 'package:tixe_flutter_app/modules/auth/personal_details/model/personal_details_request_model.dart';
import 'package:tixe_flutter_app/modules/auth/personal_details/repository/personal_details_interface.dart';
import 'package:tixe_flutter_app/modules/auth/personal_details/repository/personal_details_repository.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../../../../utils/custom_file_picker.dart';
import 'state/personal_details_state.dart';

final personalDetailsController = StateNotifierProvider.autoDispose<
    PersonalDetailsController,
    PersonalDetailsState>((ref) => PersonalDetailsController());

class PersonalDetailsController extends StateNotifier<PersonalDetailsState> {
  final IPersonalDetailsRepository _personalDetailsRepository =
      PersonalDetailsRepository();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  PersonalDetailsController()
      : super(
          const PersonalDetailsState(
            model: null,
            isButtonEnabled: false,
            armsLicense: null,
            profileImage: null,
            countries: [],
            states: [],
            cities: [],
          ),
        ) {
    nameController.addListener(checkButtonStatus);
    stateController.addListener(checkButtonStatus);
    cityController.addListener(checkButtonStatus);
    addressController.addListener(checkButtonStatus);
    countryController.addListener(checkButtonStatus);
  }

  void checkButtonStatus() {
    if (state.model?.actionType == ActionType.Registration) {
      state = state.copyWith(
          isButtonEnabled: nameController.text.trim().isNotEmpty &&
              stateController.text.trim().isNotEmpty &&
              cityController.text.trim().isNotEmpty &&
              addressController.text.trim().isNotEmpty &&
              countryController.text.trim().isNotEmpty &&
              state.armsLicense != null);
    } else if (state.model?.actionType == ActionType.Update) {
      state = state.copyWith(
          isButtonEnabled: nameController.text.trim().isNotEmpty &&
              stateController.text.trim().isNotEmpty &&
              cityController.text.trim().isNotEmpty &&
              addressController.text.trim().isNotEmpty &&
              countryController.text.trim().isNotEmpty);
    }
  }

  void setArmsLicense() {
    CustomFilePicker.pickSingleFile(
      onSuccess: (file) {
        state = state.copyWith(armsLicense: file);
        checkButtonStatus();
      },
    );
  }

  void setStateData(GlobalOptionData option) {
    stateController.text = option.value;
  }

  void setCityData(GlobalOptionData option) {
    cityController.text = option.value;
  }

  Future<void> setCountryData(
    GlobalOptionData option, {
    bool clearData = true,
  }) async {
    final country = state.countries
        .where(
          (element) => element.name == option.value,
        )
        .firstOrNull;

    'here is: $country'.log();
    if (country != null) {
      await loadAllStatesByCountryCode(country.isoCode);
      await loadCityStatesByCountryCode(country.isoCode);
    }
    if (clearData == true) {
      cityController.clear();
      stateController.clear();
    }
    countryController.text = option.value;
  }

  Future<void> loadAllCountries() async {
    ViewUtil.showLoaderPage(
      title: Navigation.key.currentContext!.loc.loading_data,
    );
    state = state.copyWith(
      countries: await getAllCountries(),
    );
    ViewUtil.hideLoader();
  }

  Future<void> loadAllStatesByCountryCode(String countryCode) async {
    ViewUtil.showLoaderPage(
      title: Navigation.key.currentContext!.loc.loading_data,
    );
    state = state.copyWith(
      states: await getStatesOfCountry(countryCode),
    );

    ViewUtil.hideLoader();
  }

  Future<void> loadCityStatesByCountryCode(String countryCode) async {
    ViewUtil.showLoaderPage(
      title: Navigation.key.currentContext!.loc.loading_data,
    );
    state = state.copyWith(
      cities: await getCountryCities(countryCode),
    );

    ViewUtil.hideLoader();
  }

  Future<void> updateRegistrationPersonalInfo() async {
    ViewUtil.showLoaderPage();
    final params = PersonalDetailsRequestModel(
      email: state.model?.email ?? "",
      name: nameController.text.trim(),
      state: stateController.text.trim(),
      city: cityController.text.trim(),
      country: countryController.text.trim(),
      address: addressController.text.trim(),
      armsLicense: state.armsLicense,
      profilePhoto: state.profileImage,
    );
    await _personalDetailsRepository.updateRegistrationPersonalInfo(
      params: params,
      // armsLicense: state.armsLicense,
      // profilePhoto: state.profileImage,
      callBack: (response, isSuccess) {
        ViewUtil.hideLoader();
        if (isSuccess) {
          if (state.model?.actionType == ActionType.Registration) {
            Navigation.pushAndRemoveUntil(
              appRoutes: AppRoutes.fitnessDetails,
              arguments: PersonalDetailsNavModel(
                email: state.model?.email ?? "",
                actionType: ActionType.Registration,
              ),
            );
          } else {
            Navigation.key.currentContext!
                .read(sharedController.notifier)
                .getProfileData(showLoader: true)
                .then((value) {
              Navigation.push(
                appRoutes: AppRoutes.fitnessDetails,
                arguments: PersonalDetailsNavModel(
                  email: state.model?.email ?? "",
                  actionType: ActionType.Update,
                  profileResponse: state.model?.profileResponse,
                ),
              );
            });
          }
        }
      },
    );
  }

  void setModel(PersonalDetailsNavModel model) {
    state = state.copyWith(model: model);
    if (state.model?.actionType == ActionType.Update &&
        state.model?.profileResponse != null) {
      setProfileData();
    }
  }

  Future<void> setProfileData() async {
    final profileData = state.model?.profileResponse?.data;
    nameController.text = profileData?.name ?? "";
    countryController.text = profileData?.profileDetails?.country ?? "";
    stateController.text = profileData?.profileDetails?.state ?? "";
    cityController.text = profileData?.profileDetails?.city ?? "";
    addressController.text = profileData?.profileDetails?.address ?? "";
    if (countryController.text.trim().isNotEmpty) {
      final option = GlobalOptionData(
        id: 0,
        value: countryController.text.trim(),
      );
      await setCountryData(option, clearData: false);
    }
  }

  void pickProfileImage() async {
    CustomFilePicker.pickSingleFile(
      extensions: [
        'jpg',
        'jpeg',
        'png',
      ],
      onSuccess: (file) {
        state = state.copyWith(profileImage: file);
        checkButtonStatus();
      },
    );
  }
}
