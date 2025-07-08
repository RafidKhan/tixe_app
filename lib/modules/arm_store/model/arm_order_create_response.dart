class ArmOrderCreateResponse {
  String? message;
  Order? order;

  ArmOrderCreateResponse({this.message, this.order});

  factory ArmOrderCreateResponse.fromJson(Map<String, dynamic> json) {
    return ArmOrderCreateResponse(
      message: json['message'],
      order: json['order'] != null ? Order.fromJson(json['order']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'order': order?.toJson(),
    };
  }
}

class Order {
  int? userId;
  String? orderNumber;
  String? status;
  num? subtotal;
  num? discount;
  num? shippingCharge;
  num? total;
  String? paymentMethod;
  int? sellerId;
  String? paymentStatus;
  int? shippingAddressId;
  int? billingAddressId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Order({
    this.userId,
    this.orderNumber,
    this.status,
    this.subtotal,
    this.discount,
    this.shippingCharge,
    this.total,
    this.paymentMethod,
    this.sellerId,
    this.paymentStatus,
    this.shippingAddressId,
    this.billingAddressId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      userId: json['user_id'],
      orderNumber: json['order_number'],
      status: json['status'],
      subtotal: json['subtotal'],
      discount: json['discount'],
      shippingCharge: json['shipping_charge'],
      total: json['total'],
      paymentMethod: json['payment_method'],
      sellerId: json['seller_id'],
      paymentStatus: json['payment_status'],
      shippingAddressId: json['shipping_address_id'],
      billingAddressId: json['billing_address_id'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'order_number': orderNumber,
      'status': status,
      'subtotal': subtotal,
      'discount': discount,
      'shipping_charge': shippingCharge,
      'total': total,
      'payment_method': paymentMethod,
      'seller_id': sellerId,
      'payment_status': paymentStatus,
      'shipping_address_id': shippingAddressId,
      'billing_address_id': billingAddressId,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }
}
