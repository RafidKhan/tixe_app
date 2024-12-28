class CustomGearData {
  final int? id;
  final String? name;
  final String? image;
  final String? buyingPrice;
  final String? rentPrice;
  GearSelection? selection;

  CustomGearData({
    required this.id,
    required this.name,
    required this.image,
    required this.buyingPrice,
    required this.rentPrice,
    required this.selection,
  });
}

enum GearSelection {
  GotIt,
  Buy,
  Rent,
}
