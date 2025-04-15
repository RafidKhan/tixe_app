import 'package:dio/dio.dart';

class CreateArmRequest {
  final String title;
  final String description;
  final String price;
  final String dailyRentalPrice;
  final List<int> categoryIds;
  final String rentalOption;
  final String quantityAvailable;
  final MultipartFile featureImage;
  final List<MultipartFile> images;

  CreateArmRequest({
    required this.title,
    required this.description,
    required this.price,
    required this.dailyRentalPrice,
    required this.categoryIds,
    required this.rentalOption,
    required this.quantityAvailable,
    required this.featureImage,
    required this.images,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'daily_rental_price': dailyRentalPrice,
      'category_ids': categoryIds,
      'rental_option': rentalOption,
      'quantity_available': quantityAvailable,
    };
  }
}