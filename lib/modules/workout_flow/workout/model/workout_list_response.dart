class WorkoutListResponse {
  int? code;
  String? message;
  Data? data;

  WorkoutListResponse({
    this.code,
    this.message,
    this.data,
  });

  factory WorkoutListResponse.fromJson(Map<String, dynamic> json) =>
      WorkoutListResponse(
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
  List<WorkoutData>? services;
  Pagination? pagination;

  Data({
    this.services,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        services: json["services"] == null
            ? []
            : List<WorkoutData>.from(
                json["services"]!.map((x) => WorkoutData.fromJson(x))),
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

class WorkoutData {
  int? id;
  String? title;
  String? type;
  String? duration;
  bool? isPremium;
  String? enrollmentStatus;
  String? asFeatured;
  String? description;
  String? gearEquipment;
  String? document;
  String? image;
  String? video;
  List<String>? galleryImages;
  List<String>? galleryVideos;
  String? preRequisitions;
  num? calories;
  String? enrollmentFee;
  String? convenienceFee;
  dynamic discountCode;

  WorkoutData({
    this.id,
    this.title,
    this.type,
    this.duration,
    this.isPremium,
    this.enrollmentStatus,
    this.asFeatured,
    this.description,
    this.gearEquipment,
    this.document,
    this.image,
    this.video,
    this.galleryImages,
    this.galleryVideos,
    this.preRequisitions,
    this.calories,
    this.enrollmentFee,
    this.convenienceFee,
    this.discountCode,
  });

  factory WorkoutData.fromJson(Map<String, dynamic> json) => WorkoutData(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        duration: json["duration"],
        isPremium: json["is_premium"],
        enrollmentStatus: json["enrollment_status"],
        asFeatured: json["as_featured"],
        description: json["description"],
        gearEquipment: json["gear_equipment"],
        document: json["document"],
        image: json["image"],
        video: json["video"],
        galleryImages: json["gallery_images"] == null
            ? []
            : List<String>.from(json["gallery_images"]!.map((x) => x)),
        galleryVideos: json["gallery_videos"] == null
            ? []
            : List<String>.from(json["gallery_videos"]!.map((x) => x)),
        preRequisitions: json["pre_requisitions"],
        calories: json["calories"],
        enrollmentFee: json["enrollment_fee"],
        convenienceFee: json["convenience_fee"],
        discountCode: json["discount_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "duration": duration,
        "is_premium": isPremium,
        "enrollment_status": enrollmentStatus,
        "as_featured": asFeatured,
        "description": description,
        "gear_equipment": gearEquipment,
        "document": document,
        "image": image,
        "video": video,
        "gallery_images": galleryImages == null
            ? []
            : List<dynamic>.from(galleryImages!.map((x) => x)),
        "gallery_videos": galleryVideos == null
            ? []
            : List<dynamic>.from(galleryVideos!.map((x) => x)),
        "pre_requisitions": preRequisitions,
        "calories": calories,
        "enrollment_fee": enrollmentFee,
        "convenience_fee": convenienceFee,
        "discount_code": discountCode,
      };
}
