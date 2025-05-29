import 'dart:io';

import '../../../list_training_form/views/list_training_form_screen.dart';
import '../../../my_arm_detail/model/my_arm_details_response.dart';
import '../../model/arms_category_response.dart';

class ListArmFormState {
  final File? featuredImage;
  final List<File> images;
  final List<ArmCategory> armsCategories;
  final List<ArmCategory> selectedCategories;
  final bool isLoadingCategories;
  final bool isButtonEnabled;
  final bool isRentalEnabled;
  final bool isEdit;
  final bool showFeaturedImageFromNetwork;
  final bool showListImageFromNetwork;
  final String? featuredNetworkImage;
  final List<CustomImage> networkImages;
  final MyArmDetailResponse? data;

  /*
  String? featuredNetworkImage;
  List<CustomImage> networkImages = [];
  bool get isEdit => widget.data != null;
  bool showFeaturedImageFromNetwork = false;
  bool showListImageFromNetwork = false;
   */

  ListArmFormState({
    required this.featuredImage,
    required this.images,
    required this.selectedCategories,
    required this.armsCategories,
    required this.isLoadingCategories,
    required this.isButtonEnabled,
    required this.isRentalEnabled,
    this.isEdit = false,
    this.showFeaturedImageFromNetwork = false,
    this.showListImageFromNetwork = false,
    this.featuredNetworkImage,
    this.networkImages = const [],
    this.data,
  });

  ListArmFormState copyWith({
    File? featuredImage,
    List<File>? images,
    List<ArmCategory>? armsCategories,
    List<ArmCategory>? selectedCategories,
    bool? isLoadingCategories,
    bool? isButtonEnabled,
    bool? isRentalEnabled,
    bool? isEdit,
    bool? showFeaturedImageFromNetwork,
    bool? showListImageFromNetwork,
    String? featuredNetworkImage,
    List<CustomImage>? networkImages,
    MyArmDetailResponse? data,
  }) {
    return ListArmFormState(
      featuredImage: featuredImage ?? this.featuredImage,
      images: images ?? this.images,
      armsCategories: armsCategories ?? this.armsCategories,
      selectedCategories: selectedCategories ?? this.selectedCategories,
      isLoadingCategories: isLoadingCategories ?? this.isLoadingCategories,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      isRentalEnabled: isRentalEnabled ?? this.isRentalEnabled,
      isEdit: isEdit ?? this.isEdit,
      showFeaturedImageFromNetwork: showFeaturedImageFromNetwork ?? this.showFeaturedImageFromNetwork,
      showListImageFromNetwork: showListImageFromNetwork ?? this.showListImageFromNetwork,
      featuredNetworkImage: featuredNetworkImage ?? this.featuredNetworkImage,
      networkImages: networkImages ?? this.networkImages,
      data: data ?? this.data,
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
      isEdit: isEdit,
      showFeaturedImageFromNetwork: showFeaturedImageFromNetwork,
      showListImageFromNetwork: showListImageFromNetwork,
      featuredNetworkImage: featuredNetworkImage,
      networkImages: networkImages,
      data: data,
    );
  }
}
