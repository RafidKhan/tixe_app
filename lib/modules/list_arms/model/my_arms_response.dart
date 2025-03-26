

class MyArmsResponse {
  int? code;
  String? message;
  List<Datum>? data;

  MyArmsResponse({
    this.code,
    this.message,
    this.data,
  });

  factory MyArmsResponse.fromJson(Map<String, dynamic> json) => MyArmsResponse(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? name;
  String? description;
  String? image;
  List<String>? galleryImages;
  String? license;
  String? price;
  num? quantity;
  String? rentPrice;
  String? whatForGear;
  List<dynamic>? categories;

  Datum({
    this.id,
    this.name,
    this.description,
    this.image,
    this.galleryImages,
    this.license,
    this.price,
    this.quantity,
    this.rentPrice,
    this.whatForGear,
    this.categories,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    galleryImages: json["gallery_images"] == null ? [] : List<String>.from(json["gallery_images"]!.map((x) => x)),
    license: json["license"],
    price: json["price"],
    quantity: json["quantity"],
    rentPrice: json["rent_price"],
    whatForGear: json["what_for_gear"],
    categories: json["categories"] == null ? [] : List<dynamic>.from(json["categories"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "gallery_images": galleryImages == null ? [] : List<dynamic>.from(galleryImages!.map((x) => x)),
    "license": license,
    "price": price,
    "quantity": quantity,
    "rent_price": rentPrice,
    "what_for_gear": whatForGear,
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
  };
}
