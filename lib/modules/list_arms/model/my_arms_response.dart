

class MyArmsResponse {
  int? code;
  String? message;
  List<ListArmData>? data;

  MyArmsResponse({
    this.code,
    this.message,
    this.data,
  });

  factory MyArmsResponse.fromJson(Map<String, dynamic> json) => MyArmsResponse(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<ListArmData>.from(json["data"]!.map((x) => ListArmData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}



class ListArmData {
  int? id;
  String? title;
  String? description;
  String? featureImage;
  List<String>? featureImages;
  String? price;
  int? quantityAvailable;
  String? dailyRentalPrice;
  dynamic rentalOption;
  List<dynamic>? categories;

  ListArmData({
    this.id,
    this.title,
    this.description,
    this.featureImage,
    this.featureImages,
    this.price,
    this.quantityAvailable,
    this.dailyRentalPrice,
    this.rentalOption,
    this.categories,
  });

  factory ListArmData.fromJson(Map<String, dynamic> json) => ListArmData(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    featureImage: json["feature_image"],
    featureImages: json["feature_images"] == null ? [] : List<String>.from(json["feature_images"]!.map((x) => x)),
    price: json["price"],
    quantityAvailable: json["quantity_available"],
    dailyRentalPrice: json["daily_rental_price"],
    rentalOption: json["rental_option"],
    categories: json["categories"] == null ? [] : List<dynamic>.from(json["categories"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "feature_image": featureImage,
    "feature_images": featureImages == null ? [] : List<dynamic>.from(featureImages!.map((x) => x)),
    "price": price,
    "quantity_available": quantityAvailable,
    "daily_rental_price": dailyRentalPrice,
    "rental_option": rentalOption,
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
  };
}

