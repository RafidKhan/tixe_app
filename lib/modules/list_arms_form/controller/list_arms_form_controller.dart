import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/modules/list_arms_form/controller/state/list_arms_form_state.dart';
import 'package:tixe_flutter_app/modules/list_arms_form/model/create_arm_request.dart';
import 'package:tixe_flutter_app/modules/list_arms_form/model/create_arm_response.dart';
import 'package:tixe_flutter_app/utils/custom_file_picker.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../repository/list_arms_form_interface.dart';
import '../repository/list_arms_form_repository.dart';

final listArmsFormController =
    StateNotifierProvider.autoDispose<ListArmsFormController, ListArmFormState>(
        (ref) => ListArmsFormController());

class ListArmsFormController extends StateNotifier<ListArmFormState> {
  final IListArmsFormRepository _listarmsformRepository =
      ListArmsFormRepository();

  final titleController = TextEditingController();
  final categoryController = TextEditingController();
  final sellingPriceController = TextEditingController();
  final descriptionController = TextEditingController();
  final quantityAvailableController = TextEditingController();
  final dailyRentalPriceController = TextEditingController();

  ListArmsFormController()
      : super(
          ListArmFormState(
            featuredImage: null,
            images: [],
            armsCategories: [],
            selectedCategories: [],
            isLoadingCategories: false,
            isButtonEnabled: false,
            isRentalEnabled: false,
          ),
        ) {
    titleController.addListener(checkButtonStatus);
    categoryController.addListener(checkButtonStatus);
    sellingPriceController.addListener(checkButtonStatus);
    descriptionController.addListener(checkButtonStatus);
    quantityAvailableController.addListener(checkButtonStatus);
    dailyRentalPriceController.addListener(checkButtonStatus);
  }

  Future<void> getArmsCategories() async {
    state = state.copyWith(
      armsCategories: [],
      isLoadingCategories: true,
    );
    await _listarmsformRepository.getArmsCategories(
      callback: (response, isSuccess) {
        state = state.copyWith(
          armsCategories: response?.data ?? [],
          isLoadingCategories: false,
        );
      },
    );
  }

  Future<void> selectFeaturedImage() async {
    final file = await pickImage();
    if (file != null) {
      state = state.copyWith(featuredImage: file);
      checkButtonStatus();
    }
  }

  Future<File?> pickImage() async {
    File? _file;
    await CustomFilePicker.pickSingleFile(
      extensions: [
        'jpg',
        'jpeg',
        'png',
      ],
      onSuccess: (file) {
        _file = file;
      },
    );
    return _file;
  }

  void removeFeaturedImage() {
    state = state.removeFeaturedImage();
    checkButtonStatus();
  }

  void addImage() async {
    if (state.images.length >= 5) {
      ViewUtil.snackBar("You can add maximum 5 images");
      return;
    }
    final file = await pickImage();
    if (file != null) {
      state = state.copyWith(images: [...state.images, file]);
      checkButtonStatus();
    }
  }

  void removeImage(int index) {
    state = state.copyWith(images: state.images..removeAt(index));
    checkButtonStatus();
  }

  void toggleRental() {
    state = state.copyWith(isRentalEnabled: !state.isRentalEnabled);
    if (!state.isRentalEnabled) {
      dailyRentalPriceController.clear();
    }
    checkButtonStatus();
  }

  void checkButtonStatus() {
    if (state.isRentalEnabled) {
      state = state.copyWith(
          isButtonEnabled: titleController.text.trim().isNotEmpty &&
              categoryController.text.trim().isNotEmpty &&
              state.selectedCategories.isNotEmpty &&
              sellingPriceController.text.trim().isNotEmpty &&
              descriptionController.text.trim().isNotEmpty &&
              quantityAvailableController.text.trim().isNotEmpty &&
              dailyRentalPriceController.text.trim().isNotEmpty &&
              state.featuredImage != null &&
              state.images.isNotEmpty);
    } else {
      state = state.copyWith(
          isButtonEnabled: titleController.text.trim().isNotEmpty &&
              categoryController.text.trim().isNotEmpty &&
              state.selectedCategories.isNotEmpty &&
              sellingPriceController.text.trim().isNotEmpty &&
              descriptionController.text.trim().isNotEmpty &&
              quantityAvailableController.text.trim().isNotEmpty &&
              state.featuredImage != null &&
              state.images.isNotEmpty);
    }
  }

  void setCategory() {
    state = state.copyWith(
        selectedCategories:
            state.armsCategories.where((e) => e.isSelected).toList());
    categoryController.text =
        state.selectedCategories.map((e) => e.name).join(", ");
  }

  Future<void> saveArmsForm() async {
    ViewUtil.showLoaderPage();
    final map = {
      'title': titleController.text,
      'description': descriptionController.text,
      'price': sellingPriceController.text,
      'daily_rental_price': dailyRentalPriceController.text,
      'category_ids': state.selectedCategories
          .map((e) => e.id.toString())
          .toList()
          .toString(),
      'rental_option': state.isRentalEnabled ? 1 : 0,
      'quantity_available': quantityAvailableController.text,
      // Files will be added separately
    };
    'here is: $map'.log();

    final formData = FormData.fromMap(map);

    // Add feature image
    formData.files.add(MapEntry(
      'feature_image',
      await MultipartFile.fromFile(
        state.featuredImage!.path, // Replace with actual file path
        filename: state.featuredImage!.path.split("/").last,
      ),
    ));

    // Add multiple images (feature_images)
    final imagePaths = state.images.map((e) => e.path).toList();

    for (var path in imagePaths) {
      formData.files.add(MapEntry(
        'feature_images', // Note: same key for multiple files
        await MultipartFile.fromFile(
          path,
          filename: path.split('/').last,
        ),
      ));
    }

    await ApiClient().request(
      url: AppUrl.createArm.url,
      params: formData,
      method: Method.POST,
      callback: (response, success) {
        ViewUtil.hideLoader();
        Navigation.pop();
        if (success && response != null) {
          final CreateArmResponse createArmResponse =
              CreateArmResponse.fromJson(response.data);
          if (createArmResponse.message != null) {
            ViewUtil.snackBar(createArmResponse.message ?? '');
          }
        }
      },
    );
  }

  // Future<void> getTrainings() async {
  //   ViewUtil.showLoaderPage();
  //   await
  // }
}
