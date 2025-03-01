import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/data_provider/pref_helper.dart';
import 'package:tixe_flutter_app/modules/dashboard/controller/state/dashboard_state.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

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
    if (index == 3 && PrefHelper.getLoginStatus() == false) {
      ViewUtil.snackBar("Please login first");
      return;
    }
    state = state.copyWith(selectedIndex: index);
  }
}
