import 'package:tixe_flutter_app/global/model/global_response.dart';

class TrainingDetailResponse {
  GlobalResponse? globalResponse;
  List<TrainingDetail>? data;

  TrainingDetailResponse({
    this.globalResponse,
    this.data,
  });

  factory TrainingDetailResponse.fromJson(Map<String, dynamic> json) =>
      TrainingDetailResponse(
        globalResponse: GlobalResponse.fromJson(json),
        data: json["data"] == null
            ? []
            : List<TrainingDetail>.from(json["data"]!.map((x) => TrainingDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "globalResponse": globalResponse?.toJson(),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class TrainingDetail {
  int? id;
  String? title;
  String? type;
  String? description;
  String? image;
  List<String>? galleryImages;
  String? preRequisitions;
  int? maxEnrollment;
  String? enrollmentFee;
  String? scheduleType;
  String? discountCode;
  DateBased? dateBased;
  DurationBased? durationBased;

  TrainingDetail({
    this.id,
    this.title,
    this.type,
    this.description,
    this.image,
    this.galleryImages,
    this.preRequisitions,
    this.maxEnrollment,
    this.enrollmentFee,
    this.scheduleType,
    this.discountCode,
    this.dateBased,
    this.durationBased,
  });

  factory TrainingDetail.fromJson(Map<String, dynamic> json) => TrainingDetail(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        description: json["description"],
        image: json["image"],
        galleryImages: json["gallery_images"] == null
            ? []
            : List<String>.from(json["gallery_images"]!.map((x) => x)),
        preRequisitions: json["pre_requisitions"],
        maxEnrollment: json["max_enrollment"],
        enrollmentFee: json["enrollment_fee"],
        scheduleType: json["schedule_type"],
        discountCode: json["discount_code"],
        dateBased: json["date_based"] == null
            ? null
            : DateBased.fromJson(json["date_based"]),
        durationBased: json["duration_based"] == null
            ? null
            : DurationBased.fromJson(json["duration_based"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "description": description,
        "image": image,
        "gallery_images": galleryImages == null
            ? []
            : List<dynamic>.from(galleryImages!.map((x) => x)),
        "pre_requisitions": preRequisitions,
        "max_enrollment": maxEnrollment,
        "enrollment_fee": enrollmentFee,
        "schedule_type": scheduleType,
        "discount_code": discountCode,
        "date_based": dateBased?.toJson(),
        "duration_based": durationBased?.toJson(),
      };
}

class DateBased {
  DateTime? startDate;
  DateTime? endDate;
  List<Date>? dates;

  DateBased({
    this.startDate,
    this.endDate,
    this.dates,
  });

  factory DateBased.fromJson(Map<String, dynamic> json) => DateBased(
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        dates: json["dates"] == null
            ? []
            : List<Date>.from(json["dates"]!.map((x) => Date.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "dates": dates == null
            ? []
            : List<dynamic>.from(dates!.map((x) => x.toJson())),
      };
}

class Date {
  DateTime? date;
  String? startAt;
  String? endAt;

  Date({
    this.date,
    this.startAt,
    this.endAt,
  });

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        startAt: json["start_at"],
        endAt: json["end_at"],
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "start_at": startAt,
        "end_at": endAt,
      };
}

class DurationBased {
  DateTime? startDate;
  DateTime? endDate;
  List<Day>? days;

  DurationBased({
    this.startDate,
    this.endDate,
    this.days,
  });

  factory DurationBased.fromJson(Map<String, dynamic> json) => DurationBased(
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        days: json["days"] == null
            ? []
            : List<Day>.from(json["days"]!.map((x) => Day.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
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
