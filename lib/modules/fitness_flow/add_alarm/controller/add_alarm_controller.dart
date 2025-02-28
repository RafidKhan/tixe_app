import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_controller.dart';
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
          ),
        );

  void setDateTime(DateTime dateTime) {
    state = state.copyWith(dateTime: dateTime);
    'here is: ${state.dateTime}'.log();
  }

  void setModel(AddAlarmNavModel? model) {
    state = state.copyWith(model: model);
    if (state.model?.alarmData?.time != null) {
      final DateTime? dateTime = state.model!.alarmData!.time!.getDateTime();
      if (dateTime != null) {
        setDateTime(dateTime);
      }
    }
  }

  Future<void> addAlarm() async {
    ViewUtil.showLoaderPage();
    await _addalarmRepository.addAlarm(
      alarmTime: DateFormat("HH:mm:ss").format(state.dateTime),
      callback: (response, isSuccess) {
        Navigation.key.currentContext!
            .read(sharedController.notifier)
            .fetchAlarms()
            .then((value) {
          ViewUtil.hideLoader();
          Navigation.pop();
          if ((response?.message ?? "").trim().isNotEmpty) {
            ViewUtil.snackBar(response?.message ?? "");
          }
        });
      },
    );
  }

  Future<void> deleteAlarm() async {
    ViewUtil.showLoaderPage();
    await _addalarmRepository.deleteAlarm(
      id: (state.model?.alarmData?.id).toString(),
      callback: (response, isSuccess) {
        Navigation.key.currentContext!
            .read(sharedController.notifier)
            .fetchAlarms()
            .then((value) {
          ViewUtil.hideLoader();
          Navigation.pop();
          if ((response?.message ?? "").trim().isNotEmpty) {
            ViewUtil.snackBar(response?.message ?? "");
          }
        });
      },
    );
  }

  Future<void> updateAlarm() async {
    ViewUtil.showLoaderPage();
    await _addalarmRepository.updateAlarm(
      id: (state.model?.alarmData?.id).toString(),
      alarmTime: DateFormat("HH:mm:ss").format(state.dateTime),
      type: state.model?.alarmData?.type??'',
      date: state.model?.alarmData?.date??'',
      callback: (response, isSuccess) {
        Navigation.key.currentContext!
            .read(sharedController.notifier)
            .fetchAlarms()
            .then((value) {
          ViewUtil.hideLoader();
          Navigation.pop();
          if ((response?.message ?? "").trim().isNotEmpty) {
            ViewUtil.snackBar(response?.message ?? "");
          }
        });
      },
    );
  }

  Future<void> disableAlarm() async {
    ViewUtil.showLoaderPage();
    await _addalarmRepository.disableAlarm(
      id: (state.model?.alarmData?.id).toString(),
      alarmTime: state.model?.alarmData?.time??'',
      type: state.model?.alarmData?.type??'',
      date: state.model?.alarmData?.date??'',
      callback: (response, isSuccess) {
        Navigation.key.currentContext!
            .read(sharedController.notifier)
            .fetchAlarms()
            .then((value) {
          ViewUtil.hideLoader();
          Navigation.pop();
          if ((response?.message ?? "").trim().isNotEmpty) {
            ViewUtil.snackBar(response?.message ?? "");
          }
        });
      },
    );
  }
}
