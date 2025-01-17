class MyEnrolledWorkoutDetail {
  int? code;
  String? message;
  MyWorkoutData? data;

  MyEnrolledWorkoutDetail({
    this.code,
    this.message,
    this.data,
  });

  factory MyEnrolledWorkoutDetail.fromJson(Map<String, dynamic> json) =>
      MyEnrolledWorkoutDetail(
        code: json["code"],
        message: json["message"],
        data:
            json["data"] == null ? null : MyWorkoutData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class MyWorkoutData {
  int? id;
  String? title;
  String? subtitle;
  String? type;
  String? createdBy;
  String? duration;
  bool? isPremium;
  String? enrollmentStatus;
  int? userId;
  String? asFeatured;
  bool? isPayment;
  String? description;
  String? gearEquipment;
  String? document;
  String? image;
  String? video;
  List<String>? galleryImages;
  List<String>? galleryVideos;
  String? preRequisitions;
  int? maxEnrollment;
  int? calories;
  String? enrollmentFee;
  String? convenienceFee;
  dynamic discountCode;
  String? createdAt;
  String? updatedAt;
  List<WorkoutPhase>? workoutPhase;

  MyWorkoutData({
    this.id,
    this.title,
    this.subtitle,
    this.type,
    this.createdBy,
    this.duration,
    this.isPremium,
    this.enrollmentStatus,
    this.userId,
    this.asFeatured,
    this.isPayment,
    this.description,
    this.gearEquipment,
    this.document,
    this.image,
    this.video,
    this.galleryImages,
    this.galleryVideos,
    this.preRequisitions,
    this.maxEnrollment,
    this.calories,
    this.enrollmentFee,
    this.convenienceFee,
    this.discountCode,
    this.createdAt,
    this.updatedAt,
    this.workoutPhase,
  });

  factory MyWorkoutData.fromJson(Map<String, dynamic> json) => MyWorkoutData(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        type: json["type"],
        createdBy: json["created_by"],
        duration: json["duration"],
        isPremium: json["is_premium"],
        enrollmentStatus: json["enrollment_status"],
        userId: json["user_id"],
        asFeatured: json["as_featured"],
        isPayment: json["is_payment"],
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
        maxEnrollment: json["max_enrollment"],
        calories: json["calories"],
        enrollmentFee: json["enrollment_fee"],
        convenienceFee: json["convenience_fee"],
        discountCode: json["discount_code"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        workoutPhase: json["workout_phase"] == null
            ? []
            : List<WorkoutPhase>.from(
                json["workout_phase"]!.map((x) => WorkoutPhase.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "type": type,
        "created_by": createdBy,
        "duration": duration,
        "is_premium": isPremium,
        "enrollment_status": enrollmentStatus,
        "user_id": userId,
        "as_featured": asFeatured,
        "is_payment": isPayment,
        "description": description,
        "gear_equipment": gearEquipment,
        "document": document,
        "image": image,
        "video": video,
        "gallery_images": galleryImages == null
            ? []
            : List<dynamic>.from(galleryImages!.map((x) => x)),
        "gallery_videos": galleryImages == null
            ? []
            : List<dynamic>.from(galleryImages!.map((x) => x)),
        "pre_requisitions": preRequisitions,
        "max_enrollment": maxEnrollment,
        "calories": calories,
        "enrollment_fee": enrollmentFee,
        "convenience_fee": convenienceFee,
        "discount_code": discountCode,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "workout_phase": workoutPhase == null
            ? []
            : List<dynamic>.from(workoutPhase!.map((x) => x.toJson())),
      };
}

class WorkoutPhase {
  int? id;
  int? workoutServiceId;
  String? title;
  int? isVideo;
  int? isCompleted;
  String? description;
  String? videoUrl;
  String? pdfUrl;
  int? durationTime;
  int? cal;
  String? completedDate;
  String? createdAt;
  String? updatedAt;

  WorkoutPhase({
    this.id,
    this.workoutServiceId,
    this.title,
    this.isVideo,
    this.isCompleted,
    this.description,
    this.videoUrl,
    this.pdfUrl,
    this.durationTime,
    this.cal,
    this.completedDate,
    this.createdAt,
    this.updatedAt,
  });

  factory WorkoutPhase.fromJson(Map<String, dynamic> json) => WorkoutPhase(
        id: json["id"],
        workoutServiceId: json["workout_service_id"],
        title: json["title"],
        isVideo: json["is_video"],
        isCompleted: json["is_completed"],
        description: json["description"],
        videoUrl: json["video_url"],
        pdfUrl: json["pdf_url"],
        durationTime: json["duration_time"],
        cal: json["cal"],
        completedDate: json["completed_date"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "workout_service_id": workoutServiceId,
        "title": title,
        "is_video": isVideo,
        "is_completed": isCompleted,
        "description": description,
        "video_url": videoUrl,
        "pdf_url": pdfUrl,
        "duration_time": durationTime,
        "cal": cal,
        "completed_date": completedDate,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
