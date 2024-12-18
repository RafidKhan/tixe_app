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

  factory SettingsResponse.fromJson(Map<String, dynamic> json) =>
      SettingsResponse(
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
  EightUnit? weightUnit;
  EightUnit? heightUnit;
  DateTime? publisherDate;
  String? favicon;
  String? logo;
  String? appVersion;
  String? appName;

  Data({
    this.weightUnit,
    this.heightUnit,
    this.publisherDate,
    this.favicon,
    this.logo,
    this.appVersion,
    this.appName,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        weightUnit: json["weight_unit"] == null
            ? null
            : EightUnit.fromJson(json["weight_unit"]),
        heightUnit: json["height_unit"] == null
            ? null
            : EightUnit.fromJson(json["height_unit"]),
        publisherDate: json["publisher_date"] == null
            ? null
            : DateTime.parse(json["publisher_date"]),
        favicon: json["favicon"],
        logo: json["logo"],
        appVersion: json["app_version"],
        appName: json["app_name"],
      );

  Map<String, dynamic> toJson() => {
        "weight_unit": weightUnit?.toJson(),
        "height_unit": heightUnit?.toJson(),
        "publisher_date":
            "${publisherDate!.year.toString().padLeft(4, '0')}-${publisherDate!.month.toString().padLeft(2, '0')}-${publisherDate!.day.toString().padLeft(2, '0')}",
        "favicon": favicon,
        "logo": logo,
        "app_version": appVersion,
        "app_name": appName,
      };
}

class EightUnit {
  String? eightUnitDefault;
  List<String>? options;

  EightUnit({
    this.eightUnitDefault,
    this.options,
  });

  factory EightUnit.fromJson(Map<String, dynamic> json) => EightUnit(
        eightUnitDefault: json["default"],
        options: json["options"] == null
            ? []
            : List<String>.from(json["options"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "default": eightUnitDefault,
        "options":
            options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
      };
}
