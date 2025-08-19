class MyReceivedOrdersResponse {
  final String? message;
  final num? code;
  final List<MyReceivedOrderData>? data;

  MyReceivedOrdersResponse({
    this.message,
    this.code,
    this.data,
  });

  factory MyReceivedOrdersResponse.fromJson(Map<String, dynamic> json) {
    return MyReceivedOrdersResponse(
      message: json['message'] as String?,
      code: json['code'] as num?,
      data: (json['data'] as List?)
          ?.map((e) => MyReceivedOrderData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'code': code,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class MyReceivedOrderData {
  final num? id;
  final String? orderNumber;
  final String? status;
  final num? total;
  final String? paymentStatus;
  final List<MyReceivedOrderItem>? items;

  MyReceivedOrderData({
    this.id,
    this.orderNumber,
    this.status,
    this.total,
    this.paymentStatus,
    this.items,
  });

  factory MyReceivedOrderData.fromJson(Map<String, dynamic> json) {
    return MyReceivedOrderData(
      id: json['id'] as num?,
      orderNumber: json['order_number'] as String?,
      status: json['status'] as String?,
      total: json['total'] is int ? json['total'] : int.tryParse(json['total']?.toString() ?? ''),
      paymentStatus: json['payment_status'] as String?,
      items: (json['items'] as List?)
          ?.map((e) => MyReceivedOrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_number': orderNumber,
      'status': status,
      'total': total,
      'payment_status': paymentStatus,
      'items': items?.map((e) => e.toJson()).toList(),
    };
  }
}

class MyReceivedOrderItem {
  final String? gearName;
  final String? gearPrice;
  final String? image;

  MyReceivedOrderItem({
    this.gearName,
    this.gearPrice,
    this.image,
  });

  factory MyReceivedOrderItem.fromJson(Map<String, dynamic> json) {
    return MyReceivedOrderItem(
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
