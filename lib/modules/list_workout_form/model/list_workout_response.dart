// To parse this JSON data, do
//
//     final listWorkoutFormResponse = listWorkoutFormResponseFromJson(jsonString);

import 'dart:convert';

ListWorkoutFormResponse listWorkoutFormResponseFromJson(String str) => ListWorkoutFormResponse.fromJson(json.decode(str));

String listWorkoutFormResponseToJson(ListWorkoutFormResponse data) => json.encode(data.toJson());

class ListWorkoutFormResponse {
  int? code;
  String? message;
  Data? data;

  ListWorkoutFormResponse({
    this.code,
    this.message,
    this.data,
  });

  factory ListWorkoutFormResponse.fromJson(Map<String, dynamic> json) => ListWorkoutFormResponse(
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
  int? id;
  String? title;
  dynamic type;
  dynamic duration;
  dynamic isPremium;
  dynamic enrollmentStatus;
  dynamic asFeatured;
  String? description;
  String? gearEquipment;
  String? document;
  String? image;
  dynamic video;
  List<String>? galleryImages;
  dynamic galleryVideos;
  dynamic preRequisitions;
  dynamic calories;
  String? notices;
  dynamic enrollmentFee;
  dynamic convenienceFee;
  dynamic discountCode;

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    galleryVideos: json["gallery_videos"],
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
    "gallery_videos": galleryVideos,
    "pre_requisitions": preRequisitions,
    "calories": calories,
    "notices": notices,
    "enrollment_fee": enrollmentFee,
    "convenience_fee": convenienceFee,
    "discount_code": discountCode,
  };
}
