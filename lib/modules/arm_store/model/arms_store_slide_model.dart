class ArmStoreSlideModel {
  int? code;
  String? message;
  List<Data>? data;

  ArmStoreSlideModel({this.code, this.message, this.data});

  ArmStoreSlideModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  String? featureImage;
  String? price;
  int? quantityAvailable;

  Data(
      {this.id,
        this.title,
        this.description,
        this.featureImage,
        this.price,
        this.quantityAvailable});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    featureImage = json['feature_image'];
    price = json['price'];
    quantityAvailable = json['quantity_available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['feature_image'] = featureImage;
    data['price'] = price;
    data['quantity_available'] = quantityAvailable;
    return data;
  }
}
