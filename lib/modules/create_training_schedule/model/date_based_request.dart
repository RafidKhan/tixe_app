class DateBasedRequest {
  String scheduleType;
  List<DateBased>? dateBased;

  DateBasedRequest({
    this.scheduleType = "date_based",
    this.dateBased,
  });

  factory DateBasedRequest.fromJson(Map<String, dynamic> json) =>
      DateBasedRequest(
        scheduleType: json["schedule_type"],
        dateBased: json["date_based"] == null
            ? []
            : List<DateBased>.from(
                json["date_based"]!.map((x) => DateBased.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "schedule_type": scheduleType,
        "date_based": dateBased == null
            ? []
            : List<dynamic>.from(dateBased!.map((x) => x.toJson())),
      };
}

class DateBased {
  String? startDate;
  String? endDate;
  List<DateBasedDate>? dates;

  DateBased({
    this.startDate,
    this.endDate,
    this.dates,
  });

  factory DateBased.fromJson(Map<String, dynamic> json) => DateBased(
        startDate: json["start_date"],
        endDate: json["end_date"],
        dates: json["dates"] == null
            ? []
            : List<DateBasedDate>.from(
                json["dates"]!.map((x) => DateBasedDate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "start_date": startDate,
        "end_date": endDate,
        "dates": dates == null
            ? []
            : List<dynamic>.from(dates!.map((x) => x.toJson())),
      };
}

class DateBasedDate {
  String? date;
  String? startAt;
  String? endAt;

  DateBasedDate({
    this.date,
    this.startAt,
    this.endAt,
  });

  factory DateBasedDate.fromJson(Map<String, dynamic> json) => DateBasedDate(
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
