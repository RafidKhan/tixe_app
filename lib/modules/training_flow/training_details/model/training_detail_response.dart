import 'package:tixe_flutter_app/global/model/global_response.dart';

class TrainingDetailResponse {
  GlobalResponse? globalResponse;
  Data? data;

  TrainingDetailResponse({
    this.globalResponse,
    this.data,
  });

  factory TrainingDetailResponse.fromJson(Map<String, dynamic> json) =>
      TrainingDetailResponse(
        globalResponse: GlobalResponse.fromJson(json),
        data: json["data"] == null ? null : Data.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        "globalResponse": globalResponse?.toJson(),
        "data": data?.toJson(),
      };
}

// class TrainingDetail {
//   int? id;
//   String? title;
//   String? type;
//   String? lat;
//   String? lon;
//   String? description;
//   String? image;
//   List<String>? galleryImages;
//   String? preRequisitions;
//   int? maxEnrollment;
//   String? enrollmentFee;
//   String? address;
//   String? scheduleType;
//   String? discountCode;
//   List<DateBased>? dateBased;
//   List<DurationBased>? durationBased;
//
//   TrainingDetail({
//     this.id,
//     this.title,
//     this.type,
//     this.lat,
//     this.lon,
//     this.description,
//     this.image,
//     this.galleryImages,
//     this.preRequisitions,
//     this.maxEnrollment,
//     this.enrollmentFee,
//     this.address,
//     this.scheduleType,
//     this.discountCode,
//     this.dateBased,
//     this.durationBased,
//   });
//
//   factory TrainingDetail.fromJson(Map<String, dynamic> json) => TrainingDetail(
//         id: json["id"],
//         title: json["title"],
//         type: json["type"],
//         lat: json["lat"],
//         lon: json["lon"],
//         description: json["description"],
//         image: json["image"],
//         galleryImages: json["gallery_images"] == null
//             ? []
//             : List<String>.from(json["gallery_images"]!.map((x) => x)),
//         preRequisitions: json["pre_requisitions"],
//         maxEnrollment: json["max_enrollment"],
//         enrollmentFee: json["enrollment_fee"],
//         address: json["address"],
//         scheduleType: json["schedule_type"],
//         discountCode: json["discount_code"],
//         dateBased: json["date_based"] == null
//             ? []
//             : List<DateBased>.from(
//                 json["date_based"]!.map((x) => DateBased.fromJson(x))),
//         durationBased: json["duration_based"] == null
//             ? []
//             : List<DurationBased>.from(
//                 json["duration_based"]!.map((x) => DurationBased.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "type": type,
//         "lat": lat,
//         "lon": lon,
//         "description": description,
//         "image": image,
//         "gallery_images": galleryImages == null
//             ? []
//             : List<dynamic>.from(galleryImages!.map((x) => x)),
//         "pre_requisitions": preRequisitions,
//         "max_enrollment": maxEnrollment,
//         "enrollment_fee": enrollmentFee,
//         "address": address,
//         "schedule_type": scheduleType,
//         "discount_code": discountCode,
//         "date_based": dateBased == null
//             ? []
//             : List<dynamic>.from(dateBased!.map((x) => x.toJson())),
//         "duration_based": durationBased == null
//             ? []
//             : List<dynamic>.from(durationBased!.map((x) => x.toJson())),
//       };
// }
//
// class DateBased {
//   String? startDate;
//   String? endDate;
//   List<Date>? dates;
//
//   DateBased({
//     this.startDate,
//     this.endDate,
//     this.dates,
//   });
//
//   factory DateBased.fromJson(Map<String, dynamic> json) => DateBased(
//         startDate: json["start_date"],
//         endDate: json["end_date"],
//         dates: json["dates"] == null
//             ? []
//             : List<Date>.from(json["dates"]!.map((x) => Date.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "start_date": startDate,
//         "end_date": endDate,
//         "dates": dates == null
//             ? []
//             : List<dynamic>.from(dates!.map((x) => x.toJson())),
//       };
// }
//
// class Date {
//   String? date;
//   String? startAt;
//   String? endAt;
//
//   Date({
//     this.date,
//     this.startAt,
//     this.endAt,
//   });
//
//   factory Date.fromJson(Map<String, dynamic> json) => Date(
//         date: json["date"],
//         startAt: json["start_at"],
//         endAt: json["end_at"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "date": date,
//         "start_at": startAt,
//         "end_at": endAt,
//       };
// }
//
// class DurationBased {
//   String? startDate;
//   String? endDate;
//   List<Day>? days;
//
//   DurationBased({
//     this.startDate,
//     this.endDate,
//     this.days,
//   });
//
//   factory DurationBased.fromJson(Map<String, dynamic> json) => DurationBased(
//         startDate: json["start_date"],
//         endDate: json["end_date"],
//         days: json["days"] == null
//             ? []
//             : List<Day>.from(json["days"]!.map((x) => Day.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "start_date": startDate,
//         "end_date": endDate,
//         "days": days == null
//             ? []
//             : List<dynamic>.from(days!.map((x) => x.toJson())),
//       };
// }
//
// class Day {
//   String? day;
//   String? startAt;
//   String? endAt;
//
//   Day({
//     this.day,
//     this.startAt,
//     this.endAt,
//   });
//
//   factory Day.fromJson(Map<String, dynamic> json) => Day(
//         day: json["day"],
//         startAt: json["start_at"],
//         endAt: json["end_at"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "day": day,
//         "start_at": startAt,
//         "end_at": endAt,
//       };
// }

class Data {
  List<TrainingDetail>? trainingService;
  ReviewStatistics? reviewStatistics;

  Data({
    this.trainingService,
    this.reviewStatistics,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        trainingService: json["training_service"] == null
            ? []
            : List<TrainingDetail>.from(json["training_service"]!
                .map((x) => TrainingDetail.fromJson(x))),
        reviewStatistics: json["review_statistics"] == null
            ? null
            : ReviewStatistics.fromJson(json["review_statistics"]),
      );

  Map<String, dynamic> toJson() => {
        "training_service": trainingService == null
            ? []
            : List<dynamic>.from(trainingService!.map((x) => x.toJson())),
        "review_statistics": reviewStatistics?.toJson(),
      };
}

class ReviewStatistics {
  num? averageRating;
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

class TrainingDetail {
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
  String? preRequisitions;
  int? maxEnrollment;
  String? enrollmentFee;
  String? conveiencesFee;
  String? address;
  String? scheduleType;
  String? discountCode;
  List<DateBased>? dateBased;
  List<DurationBased>? durationBased;

  TrainingDetail({
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
    this.preRequisitions,
    this.maxEnrollment,
    this.enrollmentFee,
    this.conveiencesFee,
    this.address,
    this.scheduleType,
    this.discountCode,
    this.dateBased,
    this.durationBased,
  });

  factory TrainingDetail.fromJson(Map<String, dynamic> json) => TrainingDetail(
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
        preRequisitions: json["pre_requisitions"],
        maxEnrollment: json["max_enrollment"],
        enrollmentFee: json["enrollment_fee"],
        conveiencesFee: json["conveiences_fee"],
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
        "pre_requisitions": preRequisitions,
        "max_enrollment": maxEnrollment,
        "enrollment_fee": enrollmentFee,
        "conveiences_fee": conveiencesFee,
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
  String? startDate;
  String? endDate;
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
