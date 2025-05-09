// To parse this JSON data, do
//
//     final listWorkoutDetail = listWorkoutDetailFromJson(jsonString);

class ListWorkoutDetail {
  int? code;
  String? message;
  ListWorkoutData? data;

  ListWorkoutDetail({
    this.code,
    this.message,
    this.data,
  });

  factory ListWorkoutDetail.fromJson(Map<String, dynamic> json) =>
      ListWorkoutDetail(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : ListWorkoutData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class ListWorkoutData {
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
  String? preRequisitions;
  int? calories;
  String? notices;
  String? enrollmentFee;
  String? convenienceFee;
  List<Module>? modules;
  List<String>? galleryImages;

  ListWorkoutData({
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
    this.preRequisitions,
    this.calories,
    this.notices,
    this.enrollmentFee,
    this.convenienceFee,
    this.modules,
    this.galleryImages,
  });

  factory ListWorkoutData.fromJson(Map<String, dynamic> json) =>
      ListWorkoutData(
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
        preRequisitions: json["pre_requisitions"],
        calories: json["calories"],
        notices: json["notices"],
        enrollmentFee: json["enrollment_fee"],
        convenienceFee: json["convenience_fee"],
        galleryImages: json["gallery_images"] == null
            ? []
            : List<String>.from(json["gallery_images"]!.map((x) => x)),
        modules: json["modules"] == null
            ? []
            : List<Module>.from(
                json["modules"]!.map((x) => Module.fromJson(x))),
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
        "pre_requisitions": preRequisitions,
        "calories": calories,
        "notices": notices,
        "enrollment_fee": enrollmentFee,
        "convenience_fee": convenienceFee,
        "gallery_images": galleryImages == null
            ? []
            : List<dynamic>.from(galleryImages!.map((x) => x)),
        "modules": modules == null
            ? []
            : List<dynamic>.from(modules!.map((x) => x.toJson())),
      };
}

class Module {
  int? id;
  int? workoutServiceId;
  String? title;
  String? type;
  int? durationTime;
  String? description;
  int? cal;
  int? isCompleted;
  dynamic completedDate;
  dynamic sections;
  String? video;
  dynamic pdf;

  Module({
    this.id,
    this.workoutServiceId,
    this.title,
    this.type,
    this.durationTime,
    this.description,
    this.cal,
    this.isCompleted,
    this.completedDate,
    this.sections,
    this.video,
    this.pdf,
  });

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        id: json["id"],
        workoutServiceId: json["workout_service_id"],
        title: json["title"],
        type: json["type"],
        durationTime: json["duration_time"],
        description: json["description"],
        cal: json["cal"],
        isCompleted: json["is_completed"],
        completedDate: json["completed_date"],
        sections: json["sections"],
        video: json["video"],
        pdf: json["pdf"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "workout_service_id": workoutServiceId,
        "title": title,
        "type": type,
        "duration_time": durationTime,
        "description": description,
        "cal": cal,
        "is_completed": isCompleted,
        "completed_date": completedDate,
        "sections": sections,
        "video": video,
        "pdf": pdf,
      };
}
