// To parse this JSON data, do
//
//     final myListedTrainingsResponse = myListedTrainingsResponseFromJson(jsonString);

import 'dart:convert';

MyListedTrainingsResponse myListedTrainingsResponseFromJson(String str) => MyListedTrainingsResponse.fromJson(json.decode(str));

String myListedTrainingsResponseToJson(MyListedTrainingsResponse data) => json.encode(data.toJson());

class MyListedTrainingsResponse {
  int? code;
  String? message;
  List<MyTraining>? data;

  MyListedTrainingsResponse({
    this.code,
    this.message,
    this.data,
  });

  factory MyListedTrainingsResponse.fromJson(Map<String, dynamic> json) => MyListedTrainingsResponse(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<MyTraining>.from(json["data"]!.map((x) => MyTraining.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class MyTraining {
  int? id;
  String? title;
  String? description;
  String? enrollmentFee;
  String? image;

  MyTraining({
    this.id,
    this.title,
    this.description,
    this.enrollmentFee,
    this.image,
  });

  factory MyTraining.fromJson(Map<String, dynamic> json) => MyTraining(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    enrollmentFee: json["enrollment_fee"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "enrollment_fee": enrollmentFee,
    "image": image,
  };
}
