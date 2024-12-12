import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/dashboard/controller/state/dashboard_state.dart';

import '../repository/dashboard_interface.dart';
import '../repository/dashboard_repository.dart';

final dashboardController =
    StateNotifierProvider<DashboardController, DashboardState>(
        (ref) => DashboardController());

class DashboardController extends StateNotifier<DashboardState> {
  final IDashboardRepository _dashboardRepository = DashboardRepository();

  DashboardController()
      : super(
          const DashboardState(
            selectedIndex: 0,
          ),
        );

  void setSelectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }
}
