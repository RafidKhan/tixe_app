import 'dart:io';

import 'package:tixe_flutter_app/global/model/global_option_item.dart';

class ListArmFormState {
  final File? featuredImage;
  final List<File> images;
  final GlobalOptionData? category;
  final bool isButtonEnabled;
  final bool isRentalEnabled;

  ListArmFormState({
    required this.featuredImage,
    required this.images,
    required this.category,
    required this.isButtonEnabled,
    required this.isRentalEnabled,
  });

  ListArmFormState copyWith({
    File? featuredImage,
    List<File>? images,
    GlobalOptionData? category,
    bool? isButtonEnabled,
    bool? isRentalEnabled,
  }) {
    return ListArmFormState(
      featuredImage: featuredImage ?? this.featuredImage,
      images: images ?? this.images,
      category: category ?? this.category,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      isRentalEnabled: isRentalEnabled ?? this.isRentalEnabled,
    );
  }

  ListArmFormState removeFeaturedImage() {
    return ListArmFormState(
      featuredImage: null,
      images: images,
      category: category,
      isButtonEnabled: isButtonEnabled,
      isRentalEnabled: isRentalEnabled,
    );
  }
}
