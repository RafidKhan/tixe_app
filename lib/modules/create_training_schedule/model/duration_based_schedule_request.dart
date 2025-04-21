class DurationBasedScheduleRequest {
  String scheduleType;
  List<DurationBased>? durationBased;

  DurationBasedScheduleRequest({
    this.scheduleType = "duration_based",
    this.durationBased,
  });

  factory DurationBasedScheduleRequest.fromJson(Map<String, dynamic> json) =>
      DurationBasedScheduleRequest(
        scheduleType: json["schedule_type"],
        durationBased: json["duration_based"] == null
            ? []
            : List<DurationBased>.from(
                json["duration_based"]!.map((x) => DurationBased.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "schedule_type": scheduleType,
        "duration_based": durationBased == null
            ? []
            : List<dynamic>.from(durationBased!.map((x) => x.toJson())),
      };
}

class DurationBased {
  String? startDate;
  String? endDate;
  List<Day>? days;

  DurationBased({
    this.startDate,
    this.endDate,
    this.days,
  });

  factory DurationBased.fromJson(Map<String, dynamic> json) => DurationBased(
        startDate: json["start_date"],
        endDate: json["end_date"],
        days: json["days"] == null
            ? []
            : List<Day>.from(json["days"]!.map((x) => Day.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "start_date": startDate,
        "end_date":endDate,
        "days": days == null
            ? []
            : List<dynamic>.from(days!.map((x) => x.toJson())),
      };
}

class Day {
  String? day;
  String? startAt;
  String? endAt;

  Day({
    this.day,
    this.startAt,
    this.endAt,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        day: json["day"],
        startAt: json["start_at"],
        endAt: json["end_at"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "start_at": startAt,
        "end_at": endAt,
      };
}
