class MyPurchaseHistoryResponse {
  final String? message;
  final int? code;
  final List<MyOrderData>? data;

  MyPurchaseHistoryResponse({
    this.message,
    this.code,
    this.data,
  });

  factory MyPurchaseHistoryResponse.fromJson(Map<String, dynamic> json) {
    return MyPurchaseHistoryResponse(
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: (json['data'] as List?)
          ?.map((e) => MyOrderData.fromJson(e as Map<String, dynamic>))
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

class MyOrderData {
  final int? id;
  final String? orderNumber;
  final String? status;
  final int? total;
  final String? paymentStatus;
  final List<OrderItem>? items;

  MyOrderData({
    this.id,
    this.orderNumber,
    this.status,
    this.total,
    this.paymentStatus,
    this.items,
  });

  factory MyOrderData.fromJson(Map<String, dynamic> json) {
    return MyOrderData(
      id: json['id'] as int?,
      orderNumber: json['order_number'] as String?,
      status: json['status'] as String?,
      total: json['total'] is int ? json['total'] : int.tryParse(json['total']?.toString() ?? ''),
      paymentStatus: json['payment_status'] as String?,
      items: (json['items'] as List?)
          ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
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

class OrderItem {
  final String? gearName;
  final String? gearPrice;
  final String? image;

  OrderItem({
    this.gearName,
    this.gearPrice,
    this.image,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
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
