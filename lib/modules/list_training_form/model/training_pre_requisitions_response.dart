

class TrainingPreRequisitionsResponse {
  int? code;
  String? message;
  List<PreRequisition>? data;

  TrainingPreRequisitionsResponse({
    this.code,
    this.message,
    this.data,
  });

  factory TrainingPreRequisitionsResponse.fromJson(Map<String, dynamic> json) => TrainingPreRequisitionsResponse(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<PreRequisition>.from(json["data"]!.map((x) => PreRequisition.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class PreRequisition {
  int? id;
  String? title;
  String? type;
  bool isSelected;

  PreRequisition({
    this.id,
    this.title,
    this.type,
    this.isSelected = false,
  });

  factory PreRequisition.fromJson(Map<String, dynamic> json) => PreRequisition(
    id: json["id"],
    title: json["title"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "type": type,
  };
}
