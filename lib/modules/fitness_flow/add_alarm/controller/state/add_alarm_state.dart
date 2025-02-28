import '../../model/add_alarm_nav_model.dart';

class AddAlarmState {
  final DateTime dateTime;
  final AddAlarmNavModel? model;

  const AddAlarmState({
    required this.dateTime,
    required this.model,
  });

  AddAlarmState  copyWith({
    DateTime? dateTime,
    AddAlarmNavModel? model,
  }) {
    return AddAlarmState(
      dateTime: dateTime ?? this.dateTime,
      model: model ?? this.model,
    );
  }
}
