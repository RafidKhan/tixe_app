

import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

class AlarmListResponse {
  int? code;
  String? message;
  List<AlarmData>? data;

  AlarmListResponse({
    this.code,
    this.message,
    this.data,
  });

  factory AlarmListResponse.fromJson(Map<String, dynamic> json) => AlarmListResponse(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<AlarmData>.from(json["data"]!.map((x) => AlarmData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AlarmData {
  int? id;
  //String? type;
  String? time;
  String? date;
  int? isEnabled;
  AlarmType? alarmType;

  AlarmData({
    this.id,
    //this.type,
    this.time,
    this.date,
    this.alarmType,
    this.isEnabled,
  });

  factory AlarmData.fromJson(Map<String, dynamic> json) => AlarmData(
    id: json["id"],
    //type: json["type"],
    time: json["time"],
    date: json["date"],
    isEnabled: json["isEnable"],
    alarmType: (json["type"]??'').toString().getAlarmType(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    //"type": type,
    "time": time,
    "date": date,
    "isEnable": isEnabled,
  };
}
