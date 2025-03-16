import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/list_arms_form/controller/state/list_arms_form_state.dart';
import 'package:tixe_flutter_app/utils/custom_file_picker.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../repository/list_arms_form_interface.dart';
import '../repository/list_arms_form_repository.dart';

final listArmsFormController =
    StateNotifierProvider.autoDispose<ListArmsFormController, ListArmFormState>(
        (ref) => ListArmsFormController());

class ListArmsFormController extends StateNotifier<ListArmFormState> {
  final IListArmsFormRepository _listarmsformRepository =
      ListArmsFormRepository();

  ListArmsFormController()
      : super(
          ListArmFormState(
            featuredImage: null,
            images: [],
          ),
        );

  Future<void> selectFeaturedImage() async {
    final file = await pickImage();
    if (file != null) {
      state = state.copyWith(featuredImage: file);
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
  }

  void addImage() async {
    if (state.images.length >= 5) {
      ViewUtil.snackBar("You can add maximum 5 images");
      return;
    }
    final file = await pickImage();
    if (file != null) {
      state = state.copyWith(images: [...state.images, file]);
    }
  }

  void removeImage(int index) {
    state = state.copyWith(images: state.images..removeAt(index));
  }
}
