class SettingsResponse {
  String? status;
  int? code;
  String? message;
  Data? data;

  SettingsResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory SettingsResponse.fromJson(Map<String, dynamic> json) => SettingsResponse(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Unit? weightUnit;
  Unit? heightUnit;
  Unit? distanceUnit;
  NotificationPreferences? notificationPreferences;

  Data({
    this.weightUnit,
    this.heightUnit,
    this.distanceUnit,
    this.notificationPreferences,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    weightUnit: json["weight_unit"] == null ? null : Unit.fromJson(json["weight_unit"]),
    heightUnit: json["height_unit"] == null ? null : Unit.fromJson(json["height_unit"]),
    distanceUnit: json["distance_unit"] == null ? null : Unit.fromJson(json["distance_unit"]),
    notificationPreferences: json["notification_preferences"] == null ? null : NotificationPreferences.fromJson(json["notification_preferences"]),
  );

  Map<String, dynamic> toJson() => {
    "weight_unit": weightUnit?.toJson(),
    "height_unit": heightUnit?.toJson(),
    "distance_unit": distanceUnit?.toJson(),
    "notification_preferences": notificationPreferences?.toJson(),
  };
}

class Unit {
  List<String>? options;

  Unit({
    this.options,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
    options: json["options"] == null ? [] : List<String>.from(json["options"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
  };
}

class NotificationPreferences {
  List<Option>? options;

  NotificationPreferences({
    this.options,
  });

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) => NotificationPreferences(
    options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
  };
}

class Option {
  String? id;
  String? value;

  Option({
    this.id,
    this.value,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    id: json["id"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "value": value,
  };
}
