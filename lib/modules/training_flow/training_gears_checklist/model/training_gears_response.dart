import 'package:tixe_flutter_app/global/model/global_response.dart';

class TrainingGearsResponse {
  GlobalResponse? globalResponse;
  List<GearData>? data;

  TrainingGearsResponse({
    this.globalResponse,
    this.data,
  });

  factory TrainingGearsResponse.fromJson(Map<String, dynamic> json) =>
      TrainingGearsResponse(
        globalResponse: GlobalResponse.fromJson(json),
        data: json["data"] == null
            ? []
            : List<GearData>.from(
                json["data"]!.map((x) => GearData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "globalResponse": globalResponse?.toJson(),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class GearData {
  int? id;
  String? name;
  String? description;
  String? image;
  String? price;
  String? rentPrice;
  String? whatForGear;

  GearData({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.rentPrice,
    this.whatForGear,
  });

  factory GearData.fromJson(Map<String, dynamic> json) => GearData(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        price: json["price"],
        rentPrice: json["rent_price"],
        whatForGear: json["what_for_gear"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "price": price,
        "rent_price": rentPrice,
        "what_for_gear": whatForGear,
      };
}
