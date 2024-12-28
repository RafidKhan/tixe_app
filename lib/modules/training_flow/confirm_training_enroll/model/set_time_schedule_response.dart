import 'package:tixe_flutter_app/global/model/global_response.dart';

class SetTimeScheduleResponse {
  GlobalResponse? globalResponse;
  Data? data;

  SetTimeScheduleResponse({
    this.globalResponse,
    this.data,
  });

  factory SetTimeScheduleResponse.fromJson(Map<String, dynamic> json) =>
      SetTimeScheduleResponse(
        globalResponse: GlobalResponse.fromJson(json),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "globalResponse": globalResponse?.toJson(),
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  int? userId;
  int? trainingServiceId;
  dynamic paymentId;
  dynamic trainingFee;
  dynamic gearsCost;
  dynamic conveniences;
  dynamic discountAmount;
  dynamic grandTotal;
  dynamic discountCode;
  TimeSchedule? timeSchedule;
  String? scheduleType;

  Data({
    this.id,
    this.userId,
    this.trainingServiceId,
    this.paymentId,
    this.trainingFee,
    this.gearsCost,
    this.conveniences,
    this.discountAmount,
    this.grandTotal,
    this.discountCode,
    this.timeSchedule,
    this.scheduleType,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        trainingServiceId: json["training_service_id"],
        paymentId: json["payment_id"],
        trainingFee: json["training_fee"],
        gearsCost: json["gears_cost"],
        conveniences: json["conveniences"],
        discountAmount: json["discount_amount"],
        grandTotal: json["grand_total"],
        discountCode: json["discount_code"],
        timeSchedule: json["time_schedule"] == null
            ? null
            : TimeSchedule.fromJson(json["time_schedule"]),
        scheduleType: json["schedule_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "training_service_id": trainingServiceId,
        "payment_id": paymentId,
        "training_fee": trainingFee,
        "gears_cost": gearsCost,
        "conveniences": conveniences,
        "discount_amount": discountAmount,
        "grand_total": grandTotal,
        "discount_code": discountCode,
        "time_schedule": timeSchedule?.toJson(),
        "schedule_type": scheduleType,
      };
}

class TimeSchedule {
  String? startDate;
  String? endDate;
  List<Date>? dates;

  TimeSchedule({
    this.startDate,
    this.endDate,
    this.dates,
  });

  factory TimeSchedule.fromJson(Map<String, dynamic> json) => TimeSchedule(
        startDate: json["start_date"],
        endDate: json["end_date"],
        dates: json["dates"] == null
            ? []
            : List<Date>.from(json["dates"]!.map((x) => Date.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "start_date": startDate,
        "end_date": endDate,
        "dates": dates == null
            ? []
            : List<dynamic>.from(dates!.map((x) => x.toJson())),
      };
}

class Date {
  String? date;
  String? startAt;
  String? endAt;

  Date({
    this.date,
    this.startAt,
    this.endAt,
  });

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        date: json["date"],
        startAt: json["start_at"],
        endAt: json["end_at"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "start_at": startAt,
        "end_at": endAt,
      };
}
