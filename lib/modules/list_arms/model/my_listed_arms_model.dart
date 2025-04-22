class MyListedArm {
  int? id;
  String title;
  String description;
  String price;
  bool renting;
  String image;
  bool isSelected;

  MyListedArm({
    required this.id,
    required this.title,
    required this.description,
    required this.renting,
    required this.price,
    required this.image,
    this.isSelected = false,
  });
}
