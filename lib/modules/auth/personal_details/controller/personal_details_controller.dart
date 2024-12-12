import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tixe_flutter_app/global/model/global_option_item.dart';
import 'package:tixe_flutter_app/modules/auth/personal_details/repository/personal_details_interface.dart';
import 'package:tixe_flutter_app/modules/auth/personal_details/repository/personal_details_repository.dart';

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

  void setCountryData(GlobalOptionData option) {
    countryController.text = option.value;
  }
}
