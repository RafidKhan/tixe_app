import 'dart:io';

import 'package:country_state_city/country_state_city.dart' as CN;
import 'package:flutter/material.dart';

import '../../model/personal_detail_nav_model.dart';

@immutable
class PersonalDetailsState {
  final PersonalDetailsNavModel? model;
  final bool isButtonEnabled;
  final File? armsLicense;
  final File? profileImage;
  final List<CN.Country> countries;
  final List<CN.State> states;
  final List<CN.City> cities;

  const PersonalDetailsState({
    required this.model,
    required this.isButtonEnabled,
    required this.armsLicense,
    required this.profileImage,
    required this.countries,
    required this.states,
    required this.cities,
  });

  PersonalDetailsState copyWith({
    PersonalDetailsNavModel? model,
    bool? isButtonEnabled,
    File? armsLicense,
    File? profileImage,
    List<CN.Country>? countries,
    List<CN.State>? states,
    List<CN.City>? cities,
  }) {
    return PersonalDetailsState(
      model: model ?? this.model,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      armsLicense: armsLicense ?? this.armsLicense,
      profileImage: profileImage ?? this.profileImage,
      countries: countries ?? this.countries,
      states: states ?? this.states,
      cities: cities ?? this.cities,
    );
  }
}
