import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/add_alarm/controller/state/add_alarm_state.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../model/add_alarm_nav_model.dart';
import '../repository/add_alarm_interface.dart';
import '../repository/add_alarm_repository.dart';

final addAlarmController =
    StateNotifierProvider.autoDispose<AddAlarmController, AddAlarmState>(
        (ref) => AddAlarmController());

class AddAlarmController extends StateNotifier<AddAlarmState> {
  final IAddAlarmRepository _addalarmRepository = AddAlarmRepository();

  AddAlarmController()
      : super(
          AddAlarmState(
            dateTime: DateTime.now(),
            model: null,
            isUpdateAlarm: false,
          ),
        );

  void setDateTime(DateTime dateTime) {
    state = state.copyWith(dateTime: dateTime);
    'here is: ${state.dateTime}'.log();
  }

  void setModel(AddAlarmNavModel? model) {
    state = state.copyWith(model: model);
    if(state.model != null){
      state = state.copyWith(isUpdateAlarm: true);
    }
    if (state.model?.dateTime != null) {
      setDateTime(state.model!.dateTime!);
    }
  }

  Future<void> addAlarm() async {
    ViewUtil.showLoaderPage();
    await _addalarmRepository.addAlarm(
      alarmTime: DateFormat("hh:mm:ss").format(state.dateTime),
      type: 'custom',
      callback: (response, isSuccess) {
        ViewUtil.hideLoader();
        Navigation.pop();
        if ((response?.message ?? "").trim().isNotEmpty) {
          ViewUtil.snackBar(response?.message ?? "");
        }
      },
    );
  }
}
