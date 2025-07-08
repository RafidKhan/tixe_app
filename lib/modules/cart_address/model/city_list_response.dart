class CityListResponse {
  int? code;
  String? message;
  List<CityData>? data;

  CityListResponse({this.code, this.message, this.data});

  factory CityListResponse.fromJson(Map<String, dynamic> json) {
    return CityListResponse(
      code: json['code'],
      message: json['message'],
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => CityData.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }
}

class CityData {
  int? id;
  String? cityName;
  String? shippingCharge;
  int? stateId;

  CityData({this.id, this.cityName, this.shippingCharge, this.stateId});

  factory CityData.fromJson(Map<String, dynamic> json) {
    return CityData(
      id: json['id'],
      cityName: json['city_name'],
      shippingCharge: json['shipping_charge'],
      stateId: json['state_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'city_name': cityName,
      'shipping_charge': shippingCharge,
      'state_id': stateId,
    };
  }
}
