import 'package:flutter/material.dart';

import '../../../../../global/model/global_option_item.dart';

@immutable
class PreferencesState {
  final GlobalOptionData? heightUnit;
  final GlobalOptionData? weightUnit;
  final GlobalOptionData? notificationPreference;
  final List<GlobalOptionData> heightUnits;
  final List<GlobalOptionData> weightUnits;
  final bool notificationEnabled;
  final List<GlobalOptionData> notificationPreferences;

  const PreferencesState({
    required this.heightUnit,
    required this.weightUnit,
    required this.heightUnits,
    required this.weightUnits,
    required this.notificationEnabled,
    required this.notificationPreferences,
    required this.notificationPreference,
  });

  PreferencesState copyWith({
    GlobalOptionData? heightUnit,
    GlobalOptionData? weightUnit,
    GlobalOptionData? notificationPreference,
    List<GlobalOptionData>? heightUnits,
    List<GlobalOptionData>? weightUnits,
    bool? notificationEnabled,
    List<GlobalOptionData>? notificationPreferences,
  }) {
    return PreferencesState(
      heightUnit: heightUnit ?? this.heightUnit,
      weightUnit: weightUnit ?? this.weightUnit,
      notificationPreference:
          notificationPreference ?? this.notificationPreference,
      heightUnits: heightUnits ?? this.heightUnits,
      weightUnits: weightUnits ?? this.weightUnits,
      notificationEnabled: notificationEnabled ?? this.notificationEnabled,
      notificationPreferences:
          notificationPreferences ?? this.notificationPreferences,
    );
  }
}
