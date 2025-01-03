import 'package:tixe_flutter_app/global/model/global_response.dart';

class MyTrainingsResponse {
  GlobalResponse? globalResponse;
  Data? data;

  MyTrainingsResponse({
    this.globalResponse,
    this.data,
  });

  factory MyTrainingsResponse.fromJson(Map<String, dynamic> json) =>
      MyTrainingsResponse(
        globalResponse: GlobalResponse.fromJson(json),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "globalResponse": globalResponse?.toJson(),
        "data": data?.toJson(),
      };
}

class Data {
  List<MyTrainingData>? services;
  Pagination? pagination;

  Data({
    this.services,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        services: json["services"] == null
            ? []
            : List<MyTrainingData>.from(
                json["services"]!.map((x) => MyTrainingData.fromJson(x))),
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
  int? pageSize;
  int? page;
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

class MyTrainingData {
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

  MyTrainingData({
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
  });

  factory MyTrainingData.fromJson(Map<String, dynamic> json) => MyTrainingData(
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
