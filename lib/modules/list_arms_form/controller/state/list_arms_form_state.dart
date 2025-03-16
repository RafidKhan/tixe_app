import 'dart:io';

class ListArmFormState {
  final File? featuredImage;
  final List<File> images;

  ListArmFormState({
    required this.featuredImage,
    required this.images,
  });

  ListArmFormState copyWith({
    File? featuredImage,
    List<File>? images,
  }) {
    return ListArmFormState(
      featuredImage: featuredImage ?? this.featuredImage,
      images: images ?? this.images,
    );
  }

  ListArmFormState removeFeaturedImage() {
    return ListArmFormState(
      featuredImage: null,
      images: images,
    );
  }
}
