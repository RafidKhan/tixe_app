import 'package:tixe_flutter_app/global/model/global_response.dart';

class TrainingListResponse {
  GlobalResponse? globalResponse;
  List<TrainingData>? data;

  TrainingListResponse({
    this.globalResponse,
    this.data,
  });

  factory TrainingListResponse.fromJson(Map<String, dynamic> json) =>
      TrainingListResponse(
        globalResponse: GlobalResponse.fromJson(json),
        data: json["data"] == null
            ? []
            : List<TrainingData>.from(json["data"]!.map((x) => TrainingData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "globalResponse": globalResponse?.toJson(),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class TrainingData {
  int? id;
  String? title;
  String? subTitle;
  String? enrolmentStatus;
  String? type;
  String? lat;
  String? lon;
  String? description;
  String? image;
  List<String>? galleryImages;
  int? maxEnrollment;
  String? enrollmentFee;
  String? conveiencesFee;
  List<GearsEquipment>? prerequisites;
  List<GearsEquipment>? gearsEquipments;
  String? address;
  String? scheduleType;
  String? discountCode;
  List<DateBased>? dateBased;
  List<DurationBased>? durationBased;

  TrainingData({
    this.id,
    this.title,
    this.subTitle,
    this.enrolmentStatus,
    this.type,
    this.lat,
    this.lon,
    this.description,
    this.image,
    this.galleryImages,
    this.maxEnrollment,
    this.enrollmentFee,
    this.conveiencesFee,
    this.prerequisites,
    this.gearsEquipments,
    this.address,
    this.scheduleType,
    this.discountCode,
    this.dateBased,
    this.durationBased,
  });

  factory TrainingData.fromJson(Map<String, dynamic> json) => TrainingData(
        id: json["id"],
        title: json["title"],
        subTitle: json["sub_title"],
        enrolmentStatus: json["enrolment_status"],
        type: json["type"],
        lat: json["lat"],
        lon: json["lon"],
        description: json["description"],
        image: json["image"],
        galleryImages: json["gallery_images"] == null
            ? []
            : List<String>.from(json["gallery_images"]!.map((x) => x)),
        maxEnrollment: json["max_enrollment"],
        enrollmentFee: json["enrollment_fee"],
        conveiencesFee: json["conveiences_fee"],
        prerequisites: json["prerequisites"] == null
            ? []
            : List<GearsEquipment>.from(
                json["prerequisites"]!.map((x) => GearsEquipment.fromJson(x))),
        gearsEquipments: json["gears_equipments"] == null
            ? []
            : List<GearsEquipment>.from(json["gears_equipments"]!
                .map((x) => GearsEquipment.fromJson(x))),
        address: json["address"],
        scheduleType: json["schedule_type"],
        discountCode: json["discount_code"],
        dateBased: json["date_based"] == null
            ? []
            : List<DateBased>.from(
                json["date_based"]!.map((x) => DateBased.fromJson(x))),
        durationBased: json["duration_based"] == null
            ? []
            : List<DurationBased>.from(
                json["duration_based"]!.map((x) => DurationBased.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "sub_title": subTitle,
        "enrolment_status": enrolmentStatus,
        "type": type,
        "lat": lat,
        "lon": lon,
        "description": description,
        "image": image,
        "gallery_images": galleryImages == null
            ? []
            : List<dynamic>.from(galleryImages!.map((x) => x)),
        "max_enrollment": maxEnrollment,
        "enrollment_fee": enrollmentFee,
        "conveiences_fee": conveiencesFee,
        "prerequisites": prerequisites == null
            ? []
            : List<dynamic>.from(prerequisites!.map((x) => x.toJson())),
        "gears_equipments": gearsEquipments == null
            ? []
            : List<dynamic>.from(gearsEquipments!.map((x) => x.toJson())),
        "address": address,
        "schedule_type": scheduleType,
        "discount_code": discountCode,
        "date_based": dateBased == null
            ? []
            : List<dynamic>.from(dateBased!.map((x) => x.toJson())),
        "duration_based": durationBased == null
            ? []
            : List<dynamic>.from(durationBased!.map((x) => x.toJson())),
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
  String? date;
  String? startAt;
  String? endAt;

  Date({
    this.date,
    this.startAt,
    this.endAt,
  });

  factory Date.fromJson(Map<String, dynamic> json) => Date(
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

class GearsEquipment {
  String? title;

  GearsEquipment({
    this.title,
  });

  factory GearsEquipment.fromJson(Map<String, dynamic> json) => GearsEquipment(
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
      };
}