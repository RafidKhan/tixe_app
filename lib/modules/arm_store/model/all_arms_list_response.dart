class AllArmsListResponse {
  int? code;
  String? message;
  ArmsData? data;

  AllArmsListResponse({this.code, this.message, this.data});

  factory AllArmsListResponse.fromJson(Map<String, dynamic> json) {
    return AllArmsListResponse(
      code: json['code'],
      message: json['message'],
      data: json['data'] != null ? ArmsData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class ArmsData {
  List<ArmItem>? arms;
  Pagination? pagination;

  ArmsData({this.arms, this.pagination});

  factory ArmsData.fromJson(Map<String, dynamic> json) {
    return ArmsData(
      arms: (json['arms'] as List?)
          ?.map((e) => ArmItem.fromJson(e))
          .toList(),
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'arms': arms?.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }
}

class ArmItem {
  int? id;
  String? title;
  String? description;
  String? featureImage;
  String? price;
  int? quantityAvailable;
  ArmOwner? armOwner;

  ArmItem({
    this.id,
    this.title,
    this.description,
    this.featureImage,
    this.price,
    this.quantityAvailable,
    this.armOwner,
  });

  factory ArmItem.fromJson(Map<String, dynamic> json) {
    return ArmItem(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      featureImage: json['feature_image'],
      price: json['price'],
      quantityAvailable: json['quantity_available'],
      armOwner: json['arm_owner'] != null
          ? ArmOwner.fromJson(json['arm_owner'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'feature_image': featureImage,
      'price': price,
      'quantity_available': quantityAvailable,
      'arm_owner': armOwner?.toJson(),
    };
  }
}

class Pagination {
  String? pageSize;
  String? page;
  int? totalPage;
  int? totalRecords;

  Pagination({
    this.pageSize,
    this.page,
    this.totalPage,
    this.totalRecords,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      pageSize: json['page_size'],
      page: json['page'],
      totalPage: json['total_page'],
      totalRecords: json['total_records'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page_size': pageSize,
      'page': page,
      'total_page': totalPage,
      'total_records': totalRecords,
    };
  }
}

class ArmOwner {
  int? id;
  String? name;

  ArmOwner({
    this.id,
    this.name,
  });

  factory ArmOwner.fromJson(Map<String, dynamic> json) {
    return ArmOwner(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
