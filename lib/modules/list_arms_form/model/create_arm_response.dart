

class CreateArmResponse {
  int? code;
  String? message;
  Data? data;

  CreateArmResponse({
    this.code,
    this.message,
    this.data,
  });

  factory CreateArmResponse.fromJson(Map<String, dynamic> json) => CreateArmResponse(
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
  int? id;
  String? title;
  String? description;
  String? featureImage;
  dynamic featureImages;
  String? price;
  String? quantityAvailable;
  dynamic dailyRentalPrice;
  String? rentalOption;
  List<Category>? categories;

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    featureImage: json["feature_image"],
    featureImages: json["feature_images"],
    price: json["price"],
    quantityAvailable: json["quantity_available"],
    dailyRentalPrice: json["daily_rental_price"],
    rentalOption: json["rental_option"],
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "feature_image": featureImage,
    "feature_images": featureImages,
    "price": price,
    "quantity_available": quantityAvailable,
    "daily_rental_price": dailyRentalPrice,
    "rental_option": rentalOption,
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
  };
}

class Category {
  int? id;
  String? name;
  String? image;
  String? slug;
  String? description;

  Category({
    this.id,
    this.name,
    this.image,
    this.slug,
    this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    slug: json["slug"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "slug": slug,
    "description": description,
  };
}
