class MyListedArm {
  int? id;
  String title;
  String description;
  String price;
  bool renting;
  String image;

  MyListedArm({
    this.id,
    required this.title,
    required this.description,
    required this.renting,
    required this.price,
    required this.image,
  });
}
