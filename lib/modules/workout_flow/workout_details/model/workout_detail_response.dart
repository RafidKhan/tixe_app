class WorkoutDetailResponse {
  int? code;
  String? message;
  Data? data;

  WorkoutDetailResponse({
    this.code,
    this.message,
    this.data,
  });

  factory WorkoutDetailResponse.fromJson(Map<String, dynamic> json) =>
      WorkoutDetailResponse(
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
  WorkoutService? workoutService;
  WorkoutReviewStatistics? reviewStatistics;

  Data({
    this.workoutService,
    this.reviewStatistics,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        workoutService: json["workout_service"] == null
            ? null
            : WorkoutService.fromJson(json["workout_service"]),
        reviewStatistics: json["review_statistics"] == null
            ? null
            : WorkoutReviewStatistics.fromJson(json["review_statistics"]),
      );

  Map<String, dynamic> toJson() => {
        "workout_service": workoutService?.toJson(),
        "review_statistics": reviewStatistics?.toJson(),
      };
}

class WorkoutReviewStatistics {
  num? averageRating;
  int? totalReviews;

  WorkoutReviewStatistics({
    this.averageRating,
    this.totalReviews,
  });

  factory WorkoutReviewStatistics.fromJson(Map<String, dynamic> json) =>
      WorkoutReviewStatistics(
        averageRating: json["average_rating"],
        totalReviews: json["total_reviews"],
      );

  Map<String, dynamic> toJson() => {
        "average_rating": averageRating,
        "total_reviews": totalReviews,
      };
}

class WorkoutService {
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
  int? calories;
  String? enrollmentFee;
  String? convenienceFee;
  dynamic discountCode;

  WorkoutService({
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

  factory WorkoutService.fromJson(Map<String, dynamic> json) => WorkoutService(
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
