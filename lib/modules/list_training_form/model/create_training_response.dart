// To parse this JSON data, do
//
//     final createTrainingResponse = createTrainingResponseFromJson(jsonString);

import 'dart:convert';

CreateTrainingResponse createTrainingResponseFromJson(String str) =>
    CreateTrainingResponse.fromJson(json.decode(str));

String createTrainingResponseToJson(CreateTrainingResponse data) =>
    json.encode(data.toJson());

class CreateTrainingResponse {
  int? code;
  String? message;
  Data? data;

  CreateTrainingResponse({
    this.code,
    this.message,
    this.data,
  });

  factory CreateTrainingResponse.fromJson(Map<String, dynamic> json) =>
      CreateTrainingResponse(
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

  Data({
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
