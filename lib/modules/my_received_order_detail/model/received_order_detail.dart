class ReceivedOrderDetailResponse {
  final String? message;
  final num? code;
  final ReceivedOrderDetailData? data;

  ReceivedOrderDetailResponse({
    this.message,
    this.code,
    this.data,
  });

  factory ReceivedOrderDetailResponse.fromJson(Map<String, dynamic> json) {
    return ReceivedOrderDetailResponse(
      message: json['message'] as String?,
      code: json['code'] as num?,
      data: json['data'] != null
          ? ReceivedOrderDetailData.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'code': code,
      'data': data?.toJson(),
    };
  }
}

class ReceivedOrderDetailData {
  final num? id;
  final String? orderNumber;
  final String? date;
  final String? status;
  final String? total;
  final String? shippingCharge;
  final String? discount;
  final num? grandTotal;
  final List<ReceivedOrderItem>? items;
  final OrderAddress? shippingDetails;
  final OrderAddress? billingDetails;

  ReceivedOrderDetailData({
    this.id,
    this.orderNumber,
    this.date,
    this.status,
    this.total,
    this.shippingCharge,
    this.discount,
    this.grandTotal,
    this.items,
    this.shippingDetails,
    this.billingDetails,
  });

  factory ReceivedOrderDetailData.fromJson(Map<String, dynamic> json) {
    return ReceivedOrderDetailData(
      id: json['id'] as num?,
      orderNumber: json['order_number'] as String?,
      date: json['date'] as String?,
      status: json['status'] as String?,
      total: json['total'] as String?,
      shippingCharge: json['shipping_charge'] as String?,
      discount: json['discount'] as String?,
      grandTotal: json['grand_total'] as num?,
      items: (json['items'] as List?)
          ?.map((e) => ReceivedOrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      shippingDetails: json['shipping_details'] != null
          ? OrderAddress.fromJson(json['shipping_details'])
          : null,
      billingDetails: json['billing_details'] != null
          ? OrderAddress.fromJson(json['billing_details'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_number': orderNumber,
      'date': date,
      'status': status,
      'total': total,
      'shipping_charge': shippingCharge,
      'discount': discount,
      'grand_total': grandTotal,
      'items': items?.map((e) => e.toJson()).toList(),
      'shipping_details': shippingDetails?.toJson(),
      'billing_details': billingDetails?.toJson(),
    };
  }
}

class ReceivedOrderItem {
  final String? gearName;
  final String? gearPrice;
  final String? image;

  ReceivedOrderItem({
    this.gearName,
    this.gearPrice,
    this.image,
  });

  factory ReceivedOrderItem.fromJson(Map<String, dynamic> json) {
    return ReceivedOrderItem(
      gearName: json['gear_name'] as String?,
      gearPrice: json['gear_price'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gear_name': gearName,
      'gear_price': gearPrice,
      'image': image,
    };
  }
}

class OrderAddress {
  final String? addressLine;
  final City? city;
  final OrderState? state;
  final String? postalCode;
  final String? country;
  final String? name;
  final String? phone;
  final String? email;

  OrderAddress({
    this.addressLine,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.name,
    this.phone,
    this.email,
  });

  factory OrderAddress.fromJson(Map<String, dynamic> json) {
    return OrderAddress(
      addressLine: json['address_line'] as String?,
      city: json['city'] != null ? City.fromJson(json['city']) : null,
      state: json['state'] != null ? OrderState.fromJson(json['state']) : null,
      postalCode: json['postal_code']?.toString(),
      country: json['country'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address_line': addressLine,
      'city': city?.toJson(),
      'state': state?.toJson(),
      'postal_code': postalCode,
      'country': country,
      'name': name,
      'phone': phone,
      'email': email,
    };
  }
}

class City {
  final num? id;
  final String? cityName;
  final String? shippingCharge;
  final num? stateId;

  City({
    this.id,
    this.cityName,
    this.shippingCharge,
    this.stateId,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] as num?,
      cityName: json['city_name'] as String?,
      shippingCharge: json['shipping_charge'] as String?,
      stateId: json['state_id'] as num?,
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

class OrderState {
  final num? id;
  final String? stateName;
  final String? sateCode;

  OrderState({
    this.id,
    this.stateName,
    this.sateCode,
  });

  factory OrderState.fromJson(Map<String, dynamic> json) {
    return OrderState(
      id: json['id'] as num?,
      stateName: json['state_name'] as String?,
      sateCode: json['sate_code'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'state_name': stateName,
      'sate_code': sateCode,
    };
  }
}
