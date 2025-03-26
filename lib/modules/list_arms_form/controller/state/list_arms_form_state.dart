import 'dart:io';

import '../../model/arms_category_response.dart';

class ListArmFormState {
  final File? featuredImage;
  final List<File> images;
  final List<ArmCategory> armsCategories;
  final List<ArmCategory> selectedCategories;
  final bool isLoadingCategories;
  final bool isButtonEnabled;
  final bool isRentalEnabled;

  ListArmFormState({
    required this.featuredImage,
    required this.images,
    required this.selectedCategories,
    required this.armsCategories,
    required this.isLoadingCategories,
    required this.isButtonEnabled,
    required this.isRentalEnabled,
  });

  ListArmFormState copyWith({
    File? featuredImage,
    List<File>? images,
    List<ArmCategory>? armsCategories,
    List<ArmCategory>? selectedCategories,
    bool? isLoadingCategories,
    bool? isButtonEnabled,
    bool? isRentalEnabled,
  }) {
    return ListArmFormState(
      featuredImage: featuredImage ?? this.featuredImage,
      images: images ?? this.images,
      armsCategories: armsCategories ?? this.armsCategories,
      selectedCategories: selectedCategories ?? this.selectedCategories,
      isLoadingCategories: isLoadingCategories ?? this.isLoadingCategories,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      isRentalEnabled: isRentalEnabled ?? this.isRentalEnabled,
    );
  }

  ListArmFormState removeFeaturedImage() {
    return ListArmFormState(
      featuredImage: null,
      images: images,
      selectedCategories: selectedCategories,
      armsCategories: armsCategories,
      isLoadingCategories: isLoadingCategories,
      isButtonEnabled: isButtonEnabled,
      isRentalEnabled: isRentalEnabled,
    );
  }
}
