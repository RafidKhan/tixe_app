class TimeScheduleRequest {
  int? trainingServiceId;
  TimeSchedule? timeSchedule;
  String? scheduleType;

  TimeScheduleRequest({
    required this.trainingServiceId,
    required this.timeSchedule,
    required this.scheduleType,
  });

  factory TimeScheduleRequest.fromJson(Map<String, dynamic> json) =>
      TimeScheduleRequest(
        trainingServiceId: json["training_service_id"],
        timeSchedule: json["time_schedule"] == null
            ? null
            : TimeSchedule.fromJson(json["time_schedule"]),
        scheduleType: json["schedule_type"],
      );

  Map<String, dynamic> toJson() => {
        "training_service_id": trainingServiceId,
        "time_schedule": timeSchedule?.toJson(),
        "schedule_type": scheduleType,
      };
}

class TimeSchedule {
  String? startDate;
  String? endDate;
  List<ConfirmDate>? dates;

  TimeSchedule({
    required this.startDate,
    required this.endDate,
    required this.dates,
  });

  factory TimeSchedule.fromJson(Map<String, dynamic> json) => TimeSchedule(
        startDate: json["start_date"],
        endDate: json["end_date"],
        dates: json["dates"] == null
            ? []
            : List<ConfirmDate>.from(
                json["dates"]!.map((x) => ConfirmDate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "start_date": startDate,
        "end_date": endDate,
        "dates": dates == null
            ? []
            : List<dynamic>.from(dates!.map((x) => x.toJson())),
      };
}

class ConfirmDate {
  String? date;
  String? startAt;
  String? endAt;

  ConfirmDate({
    required this.date,
    required this.startAt,
    required this.endAt,
  });

  factory ConfirmDate.fromJson(Map<String, dynamic> json) => ConfirmDate(
        date: json["date"],
        startAt: json["start_at"],
        endAt: json["end_at"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "start_at": startAt,
        "end_at": endAt,
      };
}
