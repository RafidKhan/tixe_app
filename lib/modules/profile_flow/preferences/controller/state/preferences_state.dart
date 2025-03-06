import 'package:flutter/material.dart';

import '../../../../../global/model/global_option_item.dart';

@immutable
class PreferencesState {
  final GlobalOptionData? heightUnit;
  final GlobalOptionData? weightUnit;
  final GlobalOptionData? notificationPreference;
  final GlobalOptionData? distanceUnit;
  final List<GlobalOptionData> heightUnits;
  final List<GlobalOptionData> weightUnits;
  final List<GlobalOptionData> distanceUnits;
  final bool notificationEnabled;
  final bool isButtonEnabled;
  final List<GlobalOptionData> notificationPreferences;

  const PreferencesState({
    required this.heightUnit,
    required this.weightUnit,
    required this.heightUnits,
    required this.weightUnits,
    required this.notificationEnabled,
    required this.notificationPreferences,
    required this.isButtonEnabled,
    required this.notificationPreference,
    required this.distanceUnit,
    required this.distanceUnits,
  });

  PreferencesState copyWith({
    GlobalOptionData? heightUnit,
    GlobalOptionData? weightUnit,
    GlobalOptionData? notificationPreference,
    GlobalOptionData? distanceUnit,
    List<GlobalOptionData>? heightUnits,
    List<GlobalOptionData>? weightUnits,
    List<GlobalOptionData>? distanceUnits,
    bool? notificationEnabled,
    bool? isButtonEnabled,
    List<GlobalOptionData>? notificationPreferences,
  }) {
    return PreferencesState(
      heightUnit: heightUnit ?? this.heightUnit,
      weightUnit: weightUnit ?? this.weightUnit,
      distanceUnit: distanceUnit ?? this.distanceUnit,
      distanceUnits: distanceUnits ?? this.distanceUnits,
      notificationPreference:
          notificationPreference ?? this.notificationPreference,
      heightUnits: heightUnits ?? this.heightUnits,
      weightUnits: weightUnits ?? this.weightUnits,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      notificationEnabled: notificationEnabled ?? this.notificationEnabled,
      notificationPreferences:
          notificationPreferences ?? this.notificationPreferences,
    );
  }
}
