class SetTrainingGearsRequest {
  int? enrollmentId;
  int? trainingServiceId;
  List<GearRequestData>? data;

  SetTrainingGearsRequest({
    required this.enrollmentId,
    required this.trainingServiceId,
    required this.data,
  });

  factory SetTrainingGearsRequest.fromJson(Map<String, dynamic> json) =>
      SetTrainingGearsRequest(
        enrollmentId: json["enrollment_id"],
        trainingServiceId: json["training_service_id"],
        data: json["data"] == null
            ? []
            : List<GearRequestData>.from(
                json["data"]!.map((x) => GearRequestData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "enrollment_id": enrollmentId,
        "training_service_id": trainingServiceId,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class GearRequestData {
  int? gearsId;
  String? buyOrRent;

  GearRequestData({
    required this.gearsId,
    required this.buyOrRent,
  });

  factory GearRequestData.fromJson(Map<String, dynamic> json) =>
      GearRequestData(
        gearsId: json["gears_id"],
        buyOrRent: json["buy_or_rent"],
      );

  Map<String, dynamic> toJson() => {
        "gears_id": gearsId,
        "buy_or_rent": buyOrRent,
      };
}
