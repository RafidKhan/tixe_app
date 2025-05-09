// To parse this JSON data, do
//
//     final listWorkoutsResponse = listWorkoutsResponseFromJson(jsonString);

import 'dart:convert';

ListWorkoutsResponse listWorkoutsResponseFromJson(String str) => ListWorkoutsResponse.fromJson(json.decode(str));

String listWorkoutsResponseToJson(ListWorkoutsResponse data) => json.encode(data.toJson());

class ListWorkoutsResponse {
  int? code;
  String? message;
  List<ListWorkout>? data;

  ListWorkoutsResponse({
    this.code,
    this.message,
    this.data,
  });

  factory ListWorkoutsResponse.fromJson(Map<String, dynamic> json) => ListWorkoutsResponse(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<ListWorkout>.from(json["data"]!.map((x) => ListWorkout.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ListWorkout {
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
  String? notices;
  String? enrollmentFee;
  String? convenienceFee;
  dynamic discountCode;

  ListWorkout({
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
    this.notices,
    this.enrollmentFee,
    this.convenienceFee,
    this.discountCode,
  });

  factory ListWorkout.fromJson(Map<String, dynamic> json) => ListWorkout(
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
    galleryImages: json["gallery_images"] == null ? [] : List<String>.from(json["gallery_images"]!.map((x) => x)),
    galleryVideos: json["gallery_videos"] == null ? [] : List<String>.from(json["gallery_videos"]!.map((x) => x)),
    preRequisitions: json["pre_requisitions"],
    calories: json["calories"],
    notices: json["notices"],
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
    "gallery_images": galleryImages == null ? [] : List<dynamic>.from(galleryImages!.map((x) => x)),
    "gallery_videos": galleryVideos == null ? [] : List<dynamic>.from(galleryVideos!.map((x) => x)),
    "pre_requisitions": preRequisitions,
    "calories": calories,
    "notices": notices,
    "enrollment_fee": enrollmentFee,
    "convenience_fee": convenienceFee,
    "discount_code": discountCode,
  };
}
