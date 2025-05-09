import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/modules/list_workout_add_module_selection/model/text_module_model.dart';
import 'package:tixe_flutter_app/modules/list_workout_add_module_selection/views/list_workout_add_module_selection_screen.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../../../utils/enum.dart';
import '../../list_workout_modules/views/list_workout_modules_screen.dart';

class ModuleController {
  static final TextEditingController type = TextEditingController();
  static final TextEditingController module = TextEditingController();
  static final TextEditingController calorie = TextEditingController();
  static final TextEditingController duration = TextEditingController();
  static ModuleTypeEnum? selectedType;
  static File? pickedFile;

  static final List<ModuleType> types = [
    const ModuleType(
      type: ModuleTypeEnum.Text,
      name: "Text",
    ),
    const ModuleType(
      type: ModuleTypeEnum.Doc,
      name: "Docs(PDF)",
    ),
    const ModuleType(
      type: ModuleTypeEnum.Video,
      name: "Video",
    ),
  ];
  static List<TextSection> textSections = [
    TextSection(
      section: TextEditingController(),
      description: TextEditingController(),
    ),
  ];

  static Future<void> createTextModule(String id) async {
    ViewUtil.showLoaderPage();
    final TextModuleModel params = TextModuleModel(
      type: selectedType,
      title: module.text,
      description: "",
      cal: calorie.text,
      durationTime: duration.text,
      sections: textSections
          .map(
            (section) => Section(
              sectionTitle: section.section.text,
              description: section.description.text,
            ),
          )
          .toList(),
    );
    await ApiClient().request(
      url: "workout-services/$id/adding-text-module",
      method: Method.POST,
      params: params.toJson(),
      callback: (response, success) {
        ViewUtil.hideLoader();
        if (success) {
          Navigation.pop(result: true);
        }
      },
    );
  }

  static Future<void> createFileModule(String id) async {
    ViewUtil.showLoaderPage();
    final params = {
      "type": selectedType == ModuleTypeEnum.Doc ? "pdf" : "video",
      "title": module.text,
      "description": "",
      "cal": calorie.text,
      "duration_time": duration.text,
    };

    final formData = FormData.fromMap(params);
    final String keyName = selectedType == ModuleTypeEnum.Doc ? "pdf" : "video";
    if (pickedFile != null) {
      formData.files.add(MapEntry(
        keyName,
        await MultipartFile.fromFile(
          pickedFile!.path,
          filename: pickedFile!.fileName,
        ),
      ));
    }

    await ApiClient().request(
      url: "workout-services/$id/adding-module",
      method: Method.POST,
      params: formData,
      callback: (response, success) {
        ViewUtil.hideLoader();
        if (success) {
          Navigation.pop(result: true);
        }
      },
    );
  }

  static void dispose() {
    type.text = "";
    module.text = "";
    calorie.text = "";
    duration.text = "";
    selectedType = null;
    textSections = [
      TextSection(
        section: TextEditingController(),
        description: TextEditingController(),
      ),
    ];
    pickedFile = null;
  }
}

class TextSection {
  final TextEditingController section;
  final TextEditingController description;

  const TextSection({
    required this.section,
    required this.description,
  });
}
