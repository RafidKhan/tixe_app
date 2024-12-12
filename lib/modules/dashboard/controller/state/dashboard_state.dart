import 'package:flutter/material.dart';

@immutable
class DashboardState {
  final int selectedIndex;

  const DashboardState({
    required this.selectedIndex,
  });

  DashboardState copyWith({
    int? selectedIndex,
  }) {
    return DashboardState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
