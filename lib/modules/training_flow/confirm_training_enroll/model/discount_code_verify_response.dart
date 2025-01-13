class DiscountCodeVerifyResponse {
  int? code;
  String? message;
  Data? data;

  DiscountCodeVerifyResponse({
    this.code,
    this.message,
    this.data,
  });

  factory DiscountCodeVerifyResponse.fromJson(Map<String, dynamic> json) =>
      DiscountCodeVerifyResponse(
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
  int? userId;
  String? trainingServiceId;
  dynamic gearId;
  int? discountCodeId;
  String? discountCode;
  bool? isVerify;
  String? verifyDateTime;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? discountAmount;
  String? discountType;

  Data({
    this.userId,
    this.trainingServiceId,
    this.gearId,
    this.discountCodeId,
    this.discountCode,
    this.isVerify,
    this.verifyDateTime,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.discountAmount,
    this.discountType,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        trainingServiceId: json["training_service_id"],
        gearId: json["gear_id"],
        discountCodeId: json["discount_code_id"],
        discountCode: json["discount_code"],
        isVerify: json["is_verify"],
        verifyDateTime: json["verify_date_time"],
        updatedAt: json["updated_at"],
        createdAt: json["created_at"],
        id: json["id"],
        discountAmount: json["discount_amount"],
        discountType: json["discount_type"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "training_service_id": trainingServiceId,
        "gear_id": gearId,
        "discount_code_id": discountCodeId,
        "discount_code": discountCode,
        "is_verify": isVerify,
        "verify_date_time": verifyDateTime,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "id": id,
        "discount_amount": discountAmount,
        "discount_type": discountType,
      };
}
