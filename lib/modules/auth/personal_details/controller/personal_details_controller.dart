import 'package:country_state_city/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tixe_flutter_app/global/model/global_option_item.dart';
import 'package:tixe_flutter_app/modules/auth/personal_details/repository/personal_details_interface.dart';
import 'package:tixe_flutter_app/modules/auth/personal_details/repository/personal_details_repository.dart';
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
            isButtonEnabled: false,
            armsLicense: null,
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
    state = state.copyWith(
        isButtonEnabled: nameController.text.trim().isNotEmpty &&
            stateController.text.trim().isNotEmpty &&
            cityController.text.trim().isNotEmpty &&
            addressController.text.trim().isNotEmpty &&
            countryController.text.trim().isNotEmpty &&
            state.armsLicense != null);
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

  void setCountryData(GlobalOptionData option) async {
    final country = state.countries
        .where(
          (element) => element.name == option.value,
        )
        .firstOrNull;
    if (country != null) {
      await loadAllStatesByCountryCode(country.isoCode);
      await loadCityStatesByCountryCode(country.isoCode);
    }
    cityController.clear();
    stateController.clear();
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
}
