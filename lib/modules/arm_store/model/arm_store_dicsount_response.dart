class ArmStoreDiscountResponse {
  int? code;
  String? message;
  DiscountData? data;

  ArmStoreDiscountResponse({this.code, this.message, this.data});

  factory ArmStoreDiscountResponse.fromJson(Map<String, dynamic> json) {
    return ArmStoreDiscountResponse(
      code: json['code'],
      message: json['message'],
      data: json['data'] != null ? DiscountData.fromJson(json['data']) : null,
    );
  }
}

class DiscountData {
  String? discountAmount;

  DiscountData({
    this.discountAmount,
  });

  factory DiscountData.fromJson(Map<String, dynamic> json) {
    return DiscountData(
      discountAmount: json['discount_amount'],
    );
  }
}
