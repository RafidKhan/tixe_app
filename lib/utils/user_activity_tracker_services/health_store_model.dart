class HealthStoreModel {
  String? patientId;
  PayloadData? payload;

  HealthStoreModel({
    this.patientId,
    this.payload,
  });

  factory HealthStoreModel.fromMap(Map<String, dynamic> json) =>
      HealthStoreModel(
        patientId: json["patient_id"],
        payload: json["data"] == null ? null : PayloadData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "patient_id": patientId,
        "data": payload?.toMap(),
      };
}

class PayloadData {
  List<dynamic>? activity;
  List<dynamic>? workout;

  PayloadData({
    this.activity,
    this.workout,
  });

  factory PayloadData.fromMap(Map<String, dynamic> json) => PayloadData(
        activity: json["activity"] == null
            ? []
            : List<dynamic>.from(json["activity"]!.map((x) => x)),
        workout: json["workout"] == null
            ? []
            : List<dynamic>.from(json["workout"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "activity":
            activity == null ? [] : List<dynamic>.from(activity!.map((x) => x)),
        "workout":
            workout == null ? [] : List<dynamic>.from(workout!.map((x) => x)),
      };
}
