import '../../model/add_alarm_nav_model.dart';

class AddAlarmState {
  final DateTime dateTime;
  final AddAlarmNavModel? model;
  final bool isUpdateAlarm;

  const AddAlarmState({
    required this.dateTime,
    required this.model,
    required this.isUpdateAlarm,
  });

  AddAlarmState  copyWith({
    DateTime? dateTime,
    AddAlarmNavModel? model,
    bool? isUpdateAlarm,
  }) {
    return AddAlarmState(
      dateTime: dateTime ?? this.dateTime,
      model: model ?? this.model,
      isUpdateAlarm: isUpdateAlarm ?? this.isUpdateAlarm,
    );
  }
}
