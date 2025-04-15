
class ArmsCategoryResponse {
  int? code;
  String? message;
  List<ArmCategory>? data;

  ArmsCategoryResponse({
    this.code,
    this.message,
    this.data,
  });

  factory ArmsCategoryResponse.fromJson(Map<String, dynamic> json) => ArmsCategoryResponse(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<ArmCategory>.from(json["data"]!.map((x) => ArmCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ArmCategory {
  int? id;
  String? name;
  String? image;
  String? slug;
  String? description;
  bool isSelected;

  ArmCategory({
    this.id,
    this.name,
    this.image,
    this.slug,
    this.description,
    this.isSelected = false,
  });

  factory ArmCategory.fromJson(Map<String, dynamic> json) => ArmCategory(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    slug: json["slug"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": name,
    "name": id,
    "image": image,
    "slug": slug,
    "description": description,
  };
}
