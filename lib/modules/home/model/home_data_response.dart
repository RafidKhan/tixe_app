import 'package:tixe_flutter_app/global/model/global_response.dart';

class HomeDataResponse {
  GlobalResponse? globalResponse;
  Data? data;

  HomeDataResponse({
    this.globalResponse,
    this.data,
  });

  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      HomeDataResponse(
        globalResponse: GlobalResponse.fromJson(json),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "globalResponse": globalResponse?.toJson(),
        "data": data?.toJson(),
      };
}

class Data {
  List<HomeDataItem>? services;
  Pagination? pagination;

  Data({
    this.services,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        services: json["services"] == null
            ? []
            : List<HomeDataItem>.from(
                json["services"]!.map((x) => HomeDataItem.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "services": services == null
            ? []
            : List<dynamic>.from(services!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

class Pagination {
  String? pageSize;
  String? page;
  int? totalPage;
  int? totalRecords;

  Pagination({
    this.pageSize,
    this.page,
    this.totalPage,
    this.totalRecords,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        pageSize: json["page_size"],
        page: json["page"],
        totalPage: json["total_page"],
        totalRecords: json["total_records"],
      );

  Map<String, dynamic> toJson() => {
        "page_size": pageSize,
        "page": page,
        "total_page": totalPage,
        "total_records": totalRecords,
      };
}

class HomeDataItem {
  int? id;
  String? title;
  String? type;
  String? location;
  String? description;
  String? image;
  List<String>? galleryImages;
  String? preRequisitions;
  int? maxEnrollment;
  String? enrollmentFee;
  String? locationUrl;
  String? scheduleType;
  String? discountCode;
  List<DateBased>? dateBased;
  DurationBased? durationBased;

  HomeDataItem({
    this.id,
    this.title,
    this.type,
    this.location,
    this.description,
    this.image,
    this.galleryImages,
    this.preRequisitions,
    this.maxEnrollment,
    this.enrollmentFee,
    this.locationUrl,
    this.scheduleType,
    this.discountCode,
    this.dateBased,
    this.durationBased,
  });

  factory HomeDataItem.fromJson(Map<String, dynamic> json) => HomeDataItem(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        location: json["location"],
        description: json["description"],
        image: json["image"],
        galleryImages: json["gallery_images"] == null
            ? []
            : List<String>.from(json["gallery_images"]!.map((x) => x)),
        preRequisitions: json["pre_requisitions"],
        maxEnrollment: json["max_enrollment"],
        enrollmentFee: json["enrollment_fee"],
        locationUrl: json["location_url"],
        scheduleType: json["schedule_type"],
        discountCode: json["discount_code"],
        dateBased: json["date_based"] == null
            ? []
            : List<DateBased>.from(
                json["date_based"]!.map((x) => DateBased.fromJson(x))),
        durationBased: json["duration_based"] == null
            ? null
            : DurationBased.fromJson(json["duration_based"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "location": location,
        "description": description,
        "image": image,
        "gallery_images": galleryImages == null
            ? []
            : List<dynamic>.from(galleryImages!.map((x) => x)),
        "pre_requisitions": preRequisitions,
        "max_enrollment": maxEnrollment,
        "enrollment_fee": enrollmentFee,
        "location_url": locationUrl,
        "schedule_type": scheduleType,
        "discount_code": discountCode,
        "date_based": dateBased == null
            ? []
            : List<dynamic>.from(dateBased!.map((x) => x.toJson())),
        "duration_based": durationBased?.toJson(),
      };
}

class DateBased {
  DateTime? date;
  String? startAt;
  String? endAt;

  DateBased({
    this.date,
    this.startAt,
    this.endAt,
  });

  factory DateBased.fromJson(Map<String, dynamic> json) => DateBased(
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
