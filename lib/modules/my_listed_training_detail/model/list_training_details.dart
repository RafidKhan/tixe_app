class ListTrainingDetails {
  int? code;
  String? message;
  Data? data;

  ListTrainingDetails({
    this.code,
    this.message,
    this.data,
  });

  factory ListTrainingDetails.fromJson(Map<String, dynamic> json) =>
      ListTrainingDetails(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  TrainingService? trainingService;
  List<dynamic>? reviewList;
  ReviewStatistics? reviewStatistics;

  Data({
    this.trainingService,
    this.reviewList,
    this.reviewStatistics,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        trainingService: json["training_service"] == null
            ? null
            : TrainingService.fromJson(json["training_service"]),
        reviewList: json["review_list"] == null
            ? []
            : List<dynamic>.from(json["review_list"]!.map((x) => x)),
        reviewStatistics: json["review_statistics"] == null
            ? null
            : ReviewStatistics.fromJson(json["review_statistics"]),
      );

  Map<String, dynamic> toJson() => {
        "training_service": trainingService?.toJson(),
        "review_list": reviewList == null
            ? []
            : List<dynamic>.from(reviewList!.map((x) => x)),
        "review_statistics": reviewStatistics?.toJson(),
      };
}

class ReviewStatistics {
  int? averageRating;
  int? totalReviews;

  ReviewStatistics({
    this.averageRating,
    this.totalReviews,
  });

  factory ReviewStatistics.fromJson(Map<String, dynamic> json) =>
      ReviewStatistics(
        averageRating: json["average_rating"],
        totalReviews: json["total_reviews"],
      );

  Map<String, dynamic> toJson() => {
        "average_rating": averageRating,
        "total_reviews": totalReviews,
      };
}

class TrainingService {
  int? id;
  String? title;
  dynamic subTitle;
  dynamic enrolmentStatus;
  dynamic type;
  String? lat;
  String? lon;
  String? description;
  String? image;
  List<String>? galleryImages;
  int? maxEnrollment;
  String? enrollmentFee;
  dynamic conveiencesFee;
  List<GearsEquipment>? prerequisites;
  List<GearsEquipment>? gearsEquipments;
  dynamic address;
  String? scheduleType;
  dynamic discountCode;
  dynamic timeSchedule;
  List<DateBased>? dateBased;
  List<DurationBased>? durationBased;

  TrainingService({
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
    this.timeSchedule,
    this.dateBased,
    this.durationBased,
  });

  factory TrainingService.fromJson(Map<String, dynamic> json) =>
      TrainingService(
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
        timeSchedule: json["time_schedule"],
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
        "time_schedule": timeSchedule,
        "date_based": dateBased == null
            ? []
            : List<dynamic>.from(dateBased!.map((x) => x.toJson())),
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
        "end_date": endDate,
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

class DateBased {
  dynamic startDate;
  dynamic endDate;
  List<Date>? dates;

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
            : List<Date>.from(json["dates"]!.map((x) => Date.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "start_date": startDate,
        "end_date": endDate,
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
