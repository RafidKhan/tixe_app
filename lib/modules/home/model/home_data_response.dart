import '../../../global/model/global_response.dart';

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
  String? description;
  String? image;
  String? enrollmentFee;
  String? scheduleType;
  num? calories;
  String? duration;
  bool? isPremium;

  HomeDataItem({
    this.id,
    this.title,
    this.type,
    this.description,
    this.image,
    this.enrollmentFee,
    this.scheduleType,
    this.calories,
    this.duration,
    this.isPremium,
  });

  factory HomeDataItem.fromJson(Map<String, dynamic> json) => HomeDataItem(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        description: json["description"],
        image: json["image"],
        enrollmentFee: json["enrollment_fee"],
        scheduleType: json["schedule_type"],
        calories: json["calories"],
        duration: json["duration"],
        isPremium: json["is_premium"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "description": description,
        "image": image,
        "enrollment_fee": enrollmentFee,
        "schedule_type": scheduleType,
        "calories": calories,
        "duration": duration,
        "is_premium": isPremium,
      };
}
