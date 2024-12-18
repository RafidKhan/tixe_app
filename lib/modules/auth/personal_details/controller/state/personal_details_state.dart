import 'dart:io';
import 'package:country_state_city/country_state_city.dart' as CN;
import 'package:flutter/material.dart';

@immutable
class PersonalDetailsState {
  final String email;
  final bool isButtonEnabled;
  final File? armsLicense;
  final List<CN.Country> countries;
  final List<CN.State> states;
  final List<CN.City> cities;

  const PersonalDetailsState({
    required this.email,
    required this.isButtonEnabled,
    required this.armsLicense,
    required this.countries,
    required this.states,
    required this.cities,
  });

  PersonalDetailsState copyWith({
    String? email,
    bool? isButtonEnabled,
    File? armsLicense,
    List<CN.Country>? countries,
    List<CN.State>? states,
    List<CN.City>? cities,
  }) {
    return PersonalDetailsState(
      email: email ?? this.email,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      armsLicense: armsLicense ?? this.armsLicense,
      countries: countries ?? this.countries,
      states: states ?? this.states,
      cities: cities ?? this.cities,
    );
  }
}
